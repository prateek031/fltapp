// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names, must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers, avoid_print, unnecessary_null_comparison

import 'package:blogapp/services/crud.dart';
import 'package:blogapp/views/uploadblog/blogbook.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserBlogs extends StatefulWidget {
  const UserBlogs({super.key});

  @override
  State<UserBlogs> createState() => _UserBlogsState();
}

class _UserBlogsState extends State<UserBlogs> {
  // ignore: unnecessary_new
  CrudMethod crudMethod = new CrudMethod();
  Stream<QuerySnapshot>? blogStream =
      FirebaseFirestore.instance.collection('dets').snapshots();

  Widget UserBlogList() {
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
              stream: FirebaseFirestore.instance.collection('dets').where('UserId', isEqualTo: crudMethod.getuid().toString()).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                
                return Expanded(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data?.docs.length ?? 0,
                    itemBuilder: (context, index) {
                      var data = snapshot.data?.docs[index].data()
                          as Map<String, dynamic>;
                      return UserBlogTile(
                        imgUrl: data['imgUrl'],
                        title: data['title'],
                        desc: data['desc'],
                        authorName: data['authorName'],
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
    crudMethod.getUserData().then((result) {
      blogStream = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.offAll(BlogBook());
          },
          child: Icon(Icons.navigate_before),
        ),
        automaticallyImplyLeading: false,
        title: Text("UserBlog"),
        centerTitle: true,
      ),
      body: UserBlogList(),
    );
  }
}

class UserBlogTile extends StatelessWidget {
  String? authorName, title, desc, imgUrl;
  UserBlogTile({this.imgUrl, this.title, this.desc, this.authorName});

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
