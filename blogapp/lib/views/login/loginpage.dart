// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace

import 'package:blogapp/views/signup/signup.dart';
import 'package:blogapp/views/uploadblog/blogbook.dart';
import 'package:blogapp/views/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:blogapp/views/login/googleauthcontroller.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.put(Logincontroller());
  final _auth = FirebaseAuth.instance;
  final _FormKey = GlobalKey<FormState>();
  final _emailControllerr = TextEditingController();
  final _passwordControllerr = TextEditingController();
  @override
  void dispose() {
    _emailControllerr.dispose();
    _passwordControllerr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Row(
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
          elevation: 0.0,
        ),
        body: LayoutBuilder(builder: (context, dimensions) {
          if (dimensions.maxWidth < 400) {
            return Stack(
              children: <Widget>[
                Form(
                  key: _FormKey,
                  child: Container(
                      // height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            'https://images.pexels.com/photos/604684/pexels-photo-604684.jpeg?auto=compress&cs=tinysrgb&w=600'),
                        fit: BoxFit.cover,
                      ))),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: [
                      Container(
                        child: FormWidget(),
                      )
                    ],
                  ),
                )
              ],
            );
          } else if (dimensions.maxWidth < 750) {
            return Stack(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1590372648787-fa5a935c2c40?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=435&q=80'),
                      fit: BoxFit.cover,
                    ))),
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: FormWidget(),
                      ),
                    ),
                  ],
                )
              ],
            );
          } else {
            return Stack(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1500964757637-c85e8a162699?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1503&q=80'),
                      fit: BoxFit.cover,
                    ))),
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: FormWidget(),
                    ),
                  ],
                )
              ],
            );
          }
        }));
  }

  Column FormWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('asset/images/logo.png'),
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
          height: 30.0,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(99, 255, 255, 255),
            shape: StadiumBorder(),
          ),
          onPressed: () {
            if (_FormKey.currentState!.validate()) {}
            _auth
                .signInWithEmailAndPassword(
                    email: _emailControllerr.text.toString(),
                    password: _passwordControllerr.text.toString())
                .then((value) {
              Get.to(() => BlogBook());
            }).onError((error, stackTrace) {
              ToastMsg().TostMessage(error.toString());
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            child: Text(
              "LogIn",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            backgroundColor: Color.fromARGB(111, 255, 255, 255),
            side:
                BorderSide(color: Color.fromARGB(255, 180, 180, 180), width: 2),
          ),
          onPressed: () {
            controller.login();
          },
          icon: Image.asset(
            'asset/images/google.png',
            height: 30.0,
            width: 30.0,
          ),
          label: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              "Sign in with Google",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account ?"),
            TextButton(
                onPressed: () {
                  Get.offAll(SignupPage());
                },
                child: Text("SignUp"))
          ],
        )
      ],
    );
  }
}
