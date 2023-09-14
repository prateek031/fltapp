// ignore_for_file: unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:blogapp/views/login/loginpage.dart';
import 'package:blogapp/views/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login/googleauthcontroller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final controller = Get.put(Logincontroller());
  final _auth = FirebaseAuth.instance;
  final _FormKey = GlobalKey<FormState>();
  final _emailControllerr = TextEditingController();
  final _passwordControllerr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("SignUp"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Form(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailControllerr,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Name',
                        hintText: 'Enter Email Address',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordControllerr,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Password',
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          _auth
                              .createUserWithEmailAndPassword(
                                  email: _emailControllerr.text.toString(),
                                  password:
                                      _passwordControllerr.text.toString())
                              .then((value) => Get.offAll(() => LoginPage()))
                              .onError((error, stackTrace) =>
                                  ToastMsg().TostMessage(error.toString()));
                        },
                        icon: Icon(Icons.add_circle_outline),
                        label: Text("SignUp")),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        TextButton(
                            onPressed: () {
                              Get.offAll(LoginPage());
                            },
                            child: Text("Sign In"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
