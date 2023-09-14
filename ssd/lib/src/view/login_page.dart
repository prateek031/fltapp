// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ssd/src/getx/controllers/login_form_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FormController formController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CustomPaint(
                size: Size(500, (500 * 1.6666666666666667).toDouble()),
                painter: RPSCustomPainter(),
              ),
            ),
            ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("YOUR",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    )),
                            Text("LOGO",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 38.h,
                        width: 100.w,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "asset/images/bbb.png",
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text("Plese Log In,",
                                style:
                                    Theme.of(context).textTheme.headlineLarge),
                          ),
                        ],
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Column(
                            children: [
                              TextField(
                                onChanged: (value) {
                                  formController.mobile.value = value;
                                },
                                keyboardType: TextInputType.phone,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                decoration: InputDecoration(
                                  focusColor: Colors.grey,
                                  hoverColor: Colors.grey,
                                  labelText: 'Mobile Number',
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Obx(() {
                                return TextField(
                                  onChanged: (value) {
                                    formController.password.value = value;
                                  },
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  obscureText:
                                      !formController.passwordVisible.value,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        formController.passwordVisible.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color:
                                            formController.passwordVisible.value
                                                ? Colors.blue
                                                : Colors.grey,
                                      ),
                                      
                                      onPressed: () {
                                        formController
                                            .togglePasswordVisibility();
                                      },
                                    ),
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2.0),
                                    ),
                                  ),
                                );
                              }),
                              SizedBox(height: 16),
                              Obx(() {
                                return ElevatedButton(
                                  onPressed: formController.isLoading.value
                                      ? null
                                      : () {
                                          formController.login();
                                        },
                                  child: formController.isLoading.value
                                      ? CircularProgressIndicator()
                                      : Text('Login'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 74, 24, 190)),
                                    fixedSize: MaterialStateProperty.all<Size>(
                                        Size(80.w, 7.h)), // Width and height
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = Color.fromARGB(255, 74, 24, 190)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3311000, size.height * 0.0103000);
    path_0.lineTo(size.width * 0.1500000, size.height * 0.3040000);
    path_0.lineTo(size.width * 0.1400000, size.height * 0.3287000);
    path_0.lineTo(size.width * 0.1400333, size.height * 0.3567400);
    path_0.lineTo(size.width * 0.1646000, size.height * 0.3765400);
    path_0.lineTo(size.width * 0.1979667, size.height * 0.3911800);
    path_0.lineTo(size.width * 0.2301000, size.height * 0.4005600);
    path_0.lineTo(size.width * 0.9756000, size.height * 0.4779800);
    path_0.lineTo(size.width * 0.9745667, size.height * 0.0113000);
    path_0.lineTo(size.width * 0.3311000, size.height * 0.0103000);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = Color.fromARGB(255, 74, 24, 190)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.05
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
