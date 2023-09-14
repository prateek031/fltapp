
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travelapp/models/mountainmodel.dart';
import 'package:travelapp/views/utils/toastmsg.dart';

class MountainRemoteServices {
  static Future<List<MountainModel>?> fetchLoaction() async {
    final response =
        await http.get(Uri.parse('https://montapi.onrender.com'));
    if (response.statusCode == 200) {
      List<dynamic> jsonString = json.decode(response.body);
      return jsonString.map((e) => MountainModel.fromJson(e)).toList();
    } else {
      ToastMsg().tostMessage("${response.statusCode}");
      print(
          "error is from the mountain api and this is the status code ${response.statusCode}");
    }
    return null;
  }
}
