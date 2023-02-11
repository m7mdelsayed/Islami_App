import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Model/RadioResponse.dart';

class ApiManager {
  static const String baseUrl = 'mp3quran.net';

  static Future<RadioResponse> getRadio() async {
    var url = Uri.https(baseUrl, '/api/v3/radios', {'language': 'ar'});
    var response = await http.get(url);
    return RadioResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }
}
