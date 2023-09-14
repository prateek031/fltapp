// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';


class ToastMsg {
  TostMessage(String messege){
    Fluttertoast.showToast(
        msg: messege,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Color.fromARGB(115, 73, 73, 73),
        textColor: Colors.white,
        fontSize: 16.0,
    );
    
  }
}