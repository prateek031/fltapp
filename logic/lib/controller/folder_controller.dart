// ignore_for_file: unused_element, unrelated_type_equality_checks

import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';

class FolderController extends GetxController {
  Future<List<Directory>> listVideoFolders() async {
  final Set<Directory> videoFolders = {};
  final appDir = await getExternalStorageDirectory();

  bool hasVideoExtension(File file) {
    final supportedExtensions = ['.mp4', '.avi', '.mkv', '.mov', '.flv'];
    final fileExtension = file.path.split('.').last.toLowerCase();
    return supportedExtensions.contains(fileExtension);
  }

  Future<void> findVideoFolders(Directory dir) async {
    final files = await dir.list().toList();
    for (final file in files) {
      if (file is File && hasVideoExtension(file)) {
        videoFolders.add(dir);
        break;
      } else if (file is Directory) {
        await findVideoFolders(file);
      }
    }
  }

  if (appDir != null) {
    await findVideoFolders(appDir);
  }

  return videoFolders.toList();
}

  // Future<void> requestStoragePermission() async {
  //   try {
  //     DeviceInfoPlugin plugin = DeviceInfoPlugin();
  //     AndroidDeviceInfo android = await plugin.androidInfo;
  //     final status = android.version.sdkInt < 33
  //         ? await Permission.storage.request()
  //         : PermissionStatus.granted;
  //     if (status.isGranted) {
  //       print("heyyyyyyy my name is emenem");
  //       listVideoFolders();
  //     } else {
  //       print("this is working");
  //       Get.snackbar("Somthing went wrong", "somthing went wrong");
  //     }
  //   } catch (e) {
  //     Get.snackbar("this is erroe", e.toString());
  //     print("this is errrorrrrr $e");
  //   }
  // }

  // Future<List<Directory>> listVideoFolders() async {
  //   print("hiii it is working");
  //   final List<Directory> videoFolders = [];
  //   final appDir = await getExternalStorageDirectory();
  //   print("thissss is   an application $appDir");
  //   bool hasVideoExtension(File file) {
  //     print("yoyoyoyoyoyoyooyoyoyoy");
  //     final supportedExtensions = ['.mp4', '.avi', '.mkv', '.mov', '.flv'];
  //     final fileExtension = file.path.split('.').last;
  //     print("this is file extension  $fileExtension");
  //     return supportedExtensions.contains(fileExtension.toLowerCase());
  //   }

  //   Future<void> findVideoFolders(Directory dir) async {
  //     final files = await dir.list().toList();
  //     print("thisss is fileees $files");
  //     print(dir);
  //     for (final file in files) {
  //       if (file is File && hasVideoExtension(file)) {
  //         videoFolders.add(dir);
  //         break;
  //       } else if (file is Directory) {
  //         final result = await FFmpegKit.execute('-i "${file.path}"');
  //         if (result.getReturnCode() == 0) {
  //           await findVideoFolders(file);
  //         }
  //       }
  //     }
  //   }

  //   await findVideoFolders(appDir!);
  //   return videoFolders.toSet().toList();
  // }
}
