// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logic/controller/folder_controller.dart';
import 'package:permission_handler/permission_handler.dart';

import 'controller/view_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GetMaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TargetPlatform  platform;
  ViewController viewController = Get.put(ViewController());
  FolderController folderController = Get.put(FolderController());

@override
  void initState() {
     if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }
    _checkPermission();
    super.initState();
  }

   Future<bool> _checkPermission() async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        final result1 = await Permission.manageExternalStorage.request();
        print("$result thiiiiisisisisisisisoi  $result1");
        if (result == PermissionStatus.granted &&
            result1 == PermissionStatus.granted) {
          folderController.listVideoFolders();
          return true;
        }
      } else {
                  folderController.listVideoFolders();

        return true;
      }
    } else {
                folderController.listVideoFolders();

      return true;
    }
    return false;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            viewController.toggleView();
          },
          icon: Obx(() {
            return viewController.isListView.value
                ? Icon(Icons.view_list)
                : Icon(Icons.grid_view);
          }),
        ),
        title: Text("Folders"),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 3,
          ),
          Icon(Icons.gif_box),
          SizedBox(
            width: 3,
          ),
          Icon(Icons.more_vert),
          SizedBox(
            width: 4,
          ),
        ],
      ),
      body: FutureBuilder<List<Directory>>(
        future: folderController.listVideoFolders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var folders = snapshot.data;
            return Obx(
              () {
                return viewController.isListView.value
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: folders?.length,
                        itemBuilder: (context, index) {
                           var folder = folders?[index];
                          return Card(
                            child: Center(
                              child: Text(folder!.path),
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: folders?.length,
                        itemBuilder: (context, index) {
                          var folder = folders?[index];
                          return ListTile(
                            hoverColor: Colors.blue,
                            title: Text(folder!.path),
                          );
                        },
                      );
              },
            );
          }
        },
      ),
    );
  }
}
