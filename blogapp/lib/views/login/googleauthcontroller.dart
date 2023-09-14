// ignore_for_file: prefer_const_constructors, non_constant_identifier_names


import 'package:blogapp/views/uploadblog/UploadBlog.dart';
import 'package:blogapp/views/login/loginpage.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../utils/toast.dart';

// import '../firebase_options.dart';


class Logincontroller extends GetxController {
  final _googleSignIn = GoogleSignIn();
  var GoogleAccount = Rx<GoogleSignInAccount?>(null);
  
  login() async {
    
   try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
     final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
    Get.to(UploadBlog());
    return await FirebaseAuth.instance.signInWithCredential(credential);
   } catch (error) {
    // ignore: avoid_print
    print("thisssssssssssssssssssssssssssssssssssssssssssssssssssssssssss$error");
     ToastMsg().TostMessage(error.toString());
   }
  }
void logout() async{
    _googleSignIn.signOut();
   await Get.offAll(LoginPage());
  
}

 
}