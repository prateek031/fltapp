import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';


class ToastMsg {
  tostMessage(String messege){
    Fluttertoast.showToast(
        msg: messege,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: const Color.fromARGB(115, 39, 37, 37),
        textColor: const Color.fromARGB(255, 255, 255, 255),
        fontSize: 16.0,
    );
    
  }
}