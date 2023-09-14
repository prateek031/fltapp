// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_string_interpolations, avoid_print, file_names, non_constant_identifier_names


import 'dart:io';

import 'package:blogapp/services/crud.dart';
import 'package:blogapp/views/uploadblog/blogbook.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class UploadBlog extends StatefulWidget {
  const UploadBlog({super.key});

  @override
  State<UploadBlog> createState() => _UploadBlogState();
}

class _UploadBlogState extends State<UploadBlog> {
   String? authorName;
  String? title;
  String? desc;
  File? selectedImage;
  bool _isLoading =false;
  FirebaseStorage storage = FirebaseStorage.instance;
   CrudMethod crudMethod = CrudMethod();
   
    

  Future getImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = image != null ? File(image.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
     
    void uploadBlog() async {
      var uid=crudMethod.getuid();
          setState(() {
                _isLoading=true;
              });
      try {
        if (selectedImage != null) {
          print("thissss iss db1 $selectedImage");

          Reference storageReference = storage
              .ref()
              .child("blogimages")
              .child('${randomAlphaNumeric(9)}.jpg');
          print("thi is db2 $storageReference");
          final TaskSnapshot task =
              await storageReference.putFile(selectedImage!);
          final downloadUrl = await task.ref.getDownloadURL();
          print("taskkk it is $downloadUrl");
            Map<String,dynamic>blogMap ={
              "imgUrl": downloadUrl,
              "authorName": authorName,
              "title":title,
              "desc":desc,
              "UserId":uid,
            };
            crudMethod.addData(blogMap).then((result){
              Get.offAll(context);
            });
             setState(() {
                _isLoading=false;
                Get.offAll(BlogBook());
              });
        }
      } catch (e) {
        print("thisssssss issssssssss errrrrrrrrrrrrrrrrrrrrrr$e");
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.offAll(BlogBook());
          },
          child: Icon(
          Icons.navigate_before,
          size: 22,
        ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "Blog",
              style: TextStyle(
                fontSize: 22,
                color: Colors.blue,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
          
              uploadBlog();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                Icons.upload_rounded,
                size: 22,
              ),
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(19, 2, 2, 2),
        centerTitle: true,
        elevation: 0,
      ),
      body: _isLoading?Center(
        child: CircularProgressIndicator(),
      ):Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                getImage();
              },
              child: selectedImage != null
                  ? Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          selectedImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromARGB(255, 238, 236, 232),
                      ),
                      child: Icon(
                        Icons.add_a_photo,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Author Name",
                    ),
                    onChanged: (value) {
                      authorName = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Title"),
                    onChanged: (value) {
                      title = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Desc"),
                    onChanged: (value) {
                      desc = value;
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
