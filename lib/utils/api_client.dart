import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:test_project_zaag/constants/constant.dart';
class HttpClient {
  // Get:-----------------------------------------------------------------------
  static var client = http.Client();
  static Future<dynamic> get(String path) async {
    try {
      var response = await client.get(Uri.parse(path)).then(_createResponse);
      return response;
    } catch (e) {
      print('catch from get $e');
    }
  }

  ///POST Request
  static Future<dynamic> post(String path, dynamic payload) async {
    try {
      print(payload);
      var url = Uri.parse(path);
      var encodedPayload = json.encode(payload);
      var response =
      await client.post(url, body: encodedPayload, headers: AppConstants.headers);
      print(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      print("exceptions print from api call $e");
    }
  }

  ///PUT Request
  static Future<dynamic> put(path, dynamic object) async {
    var url = Uri.parse(path);
    var payload = json.encode(object);

    var response = await client.put(url, body: payload, headers: AppConstants.headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      //throw exception and catch it in UI
    }
  }

  ///Delete Request
  static Future<dynamic> delete(path) async {
    var url = Uri.parse(path);
    var response = await client.delete(url, headers: AppConstants.headers);
    var body = json.decode(response.body);
    var status = body['success'];
    try {
      debugPrint('Statuss: $status');
      if (status == 'true' || status == true) {
        debugPrint('Response: ${response.body}');
        return jsonDecode(response.body);
      } else {
        debugPrint('Error from $path: ${body['message']}');
      }
    } catch (e) {
      debugPrint('Exception from delete $path: $e');
    }
  }

  static _createResponse(http.Response response) {
    final String res = response.body;
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400) {
      throw Exception('Error fetching data from server$statusCode');
    }
    return jsonDecode(res);
  }
}
