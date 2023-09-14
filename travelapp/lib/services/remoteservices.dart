// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travelapp/models/locationmodel.dart';
import 'package:travelapp/views/utils/toastmsg.dart';

class RemoteServices {
  static Future<List<LocationModel>?> fetchLoaction() async {
    final response =
        await http.get(Uri.parse('https://api-418u.onrender.com/'));
    if (response.statusCode == 200) {
      List<dynamic> jsonString = json.decode(response.body);
      return jsonString.map((e) => LocationModel.fromJson(e)).toList();
    } else {
      ToastMsg().tostMessage("${response.statusCode}");
      print(
          "error is from the location api and this is the status code ${response.statusCode}");
    }
    return null;
  }
}
