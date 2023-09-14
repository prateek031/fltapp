// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names, must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers, avoid_print, unnecessary_null_comparison

import 'package:blogapp/services/crud.dart';
import 'package:blogapp/views/login/loginpage.dart';
import 'package:blogapp/views/uploadblog/uploadblog.dart';
import 'package:blogapp/views/uploadblog/userblog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BlogBook extends StatefulWidget {
  const BlogBook({super.key});

  @override
  State<BlogBook> createState() => _BlogBookState();
}

class _BlogBookState extends State<BlogBook> {
  // ignore: unnecessary_new
  CrudMethod crudMethod = new CrudMethod();
  Stream<QuerySnapshot>? blogStream =
      FirebaseFirestore.instance.collection('dets').snapshots();

  Widget BlogList() {
    if (blogStream == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: blogStream,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return Expanded(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data?.docs.length ?? 0,
                    itemBuilder: (context, index) {
                      var data = snapshot.data?.docs[index].data()
                          as Map<String, dynamic>;
                      return BlogsTile(
                        imgUrl: data['imgUrl'] ??
                            'https://th.bing.com/th/id/OIP.I4X_ilJ5O8dMg1yrVXovmQHaEo?pid=ImgDet&rs=1',
                        title: data['title'] ??
                            'Title is not avilable for this post',
                        desc: data['desc'] ??
                            'Description is not avilable or not fedded by author',
                        authorName: data['authorName'] ?? 'Some good author',
                        
                      );
                    },
                  ),
                );
              }),
        ],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    crudMethod.getData().then((result) {
      blogStream = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:GestureDetector(
            onTap: (){
              Get.offAll(UserBlogs());
            },
            child: Icon(Icons.list_alt),
          ) ,
          automaticallyImplyLeading: false,
          title: Text("BlogBook"),
          centerTitle: true,
          actions: [
            Padding(
              
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Get.offAll(LoginPage());
                },
                child: Icon(Icons.settings,),
              )
            ),
          ],
        ),
        body: BlogList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => UploadBlog());
          },
          child: const Icon(Icons.upload),
          backgroundColor: Color.fromARGB(232, 255, 194, 81),
          hoverColor: Color.fromARGB(185, 255, 156, 7),
          splashColor: Colors.blue,
        ));
  }
}

class BlogsTile extends StatelessWidget {
  String? authorName, title, desc, imgUrl;
  BlogsTile({this.imgUrl, this.title, this.desc, this.authorName});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Container(
          margin: EdgeInsets.all(10),
          height: 300,
          color: Color.fromARGB(131, 128, 128, 128),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: '$imgUrl',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Text("Author Name:- $authorName"),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Title:-$title"),
                      ],
                    ),
                    Row(children: [
                      Expanded(
                        child: Text(
                          "Description:-$desc",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
