import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mofresh/utils/URL.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  final url = '${Mofresh.url2}addClient2';
  String clientCode = "";

  Future<void> signUp(
      String clientNames,
      String clientContact,
      String clientEmail,
      String clientUserName,
      String clientTin,
      String password,
      String clientLocation,
      String businessType) async {
    await http
        .post(Uri.parse(url),
            body: ({
              'clientNames': clientNames,
              'clientContact': clientContact,
              'clientEmail': clientEmail,
              'clientPassword': password,
              'clientUsername': clientUserName,
              'clientTin': clientTin,
              'businessType': businessType,
              'clientLocation': clientLocation,
            }))
        .then((value) async {
      final user = json.decode(value.body);
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("token", user['token']);
      await pref.setString("clientCode", user["clientCode"]);
    });
  }

  Future<void> getClientCode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    clientCode = await pref.getString("clientCode")!;
  }

  String get clientCodes {
    return clientCode;
  }
}
