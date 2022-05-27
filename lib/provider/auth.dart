import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mofresh/utils/URL.dart';

class Auth with ChangeNotifier {
  final url = '${Mofresh.url2}addClient2';
  Future<void> signUp(
      String clientNames,
      String clientContact,
      String clientEmail,
      String clientUserName,
      String clientTin,
      String password,
      String clientLocation,
      String businessType) async {
    try {
      var headers = {'Accept': 'application/json'};
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://kivu.mofresh.rw/api/addClient2'));
      request.fields.addAll({
        'clientNames': clientNames,
        'clientContact': clientContact,
        'clientEmail': clientEmail,
        'clientPassword': password,
        'clientUsername': clientUserName,
        'clientTin': clientTin,
        'businessType': businessType,
        'clientLocation': clientLocation,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
