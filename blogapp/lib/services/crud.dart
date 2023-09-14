// ignore_for_file: body_might_complete_normally_catch_error, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../views/utils/toast.dart';

class CrudMethod {
  final collection = FirebaseFirestore.instance.collection("dets");

  Future<void> addData(Map<String, dynamic> blogData) async {
    //this code is saving the data to cloud fire store
    await collection.add(blogData).catchError((e) {
      ToastMsg().TostMessage(e.toString());
    });
  }

  getData() async {
    return collection.snapshots();
  }

  getUserData() async {
    print("thhhhdhdhdhvdhvchdsc id  ${getuid()}");
    return collection.where("UserId", isEqualTo:getuid().toString()).snapshots();
  }

  getuid() {
    return FirebaseAuth.instance.currentUser?.uid;
  }
}
