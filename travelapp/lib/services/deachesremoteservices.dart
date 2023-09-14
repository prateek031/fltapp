// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travelapp/models/beachesmodel.dart';

class BeachesRemoteServices {
  static Future<List<BeachesModel>?> fetchLoaction() async {
    final response =
        await http.get(Uri.parse('https://beachapi.onrender.com/'));
    if (response.statusCode == 200) {
      List<dynamic> jsonString = json.decode(response.body);
      return jsonString.map((e) => BeachesModel.fromJson(e)).toList();
    } else {
      print(
          " error is from the beach api and this is the status code ${response.statusCode}");
    }
    return null;
  }
}
