// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mvvmapp/core/theme/theme.dart';
import 'package:mvvmapp/core/utils/enviroment.dart';
import 'package:mvvmapp/services/routing/routes.dart';
import 'package:mvvmapp/src/binding/network_binding.dart';
import 'package:mvvmapp/src/binding/theme_binding.dart';
import 'package:sizer/sizer.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  ThemeBinding().dependencies();
  NetworkBinding().dependencies();

  await dotenv.load(fileName: EnviormentFile.fileName);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomThemes.light,
          darkTheme: CustomThemes.dark,
          initialRoute: Routes.HomePage,
          getPages: getPages,
        );
      },
    );
  }
}
