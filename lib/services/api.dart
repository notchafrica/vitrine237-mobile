import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'config.dart';

class API {
  static const Object tmpData = {};
  static const String token = "";
  static Locale locale;

  static post(url, {Object data = tmpData}) async {
    var prettyUrl = Config.baseUrl + url;
    var header = await __setHeaders();
    return await http.post(prettyUrl, body: jsonEncode(data), headers: header);
  }

  static put(url, {Object data = tmpData}) async {
    var prettyUrl = Config.baseUrl + url;
    var header = await __setHeaders();
    return await http.put(prettyUrl, body: jsonEncode(data), headers: header);
  }

  static get(url) async {
    var prettyUrl = Config.baseUrl + url;
    var header = await __setHeaders();
    return await http.get(prettyUrl, headers: header);
  }

  static delete(url) async {
    var pretyUrl = Config.baseUrl + url;

    var header = await __setHeaders();

    return await http.delete(pretyUrl, headers: header);
  }

  static __setHeaders() async {
    var token;

    await getAccessToken().then((r) {
      token = r;
    });

    if (token != null) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    } else {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
  }

  static getAccessToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    return localStorage.getString('access_token');
  }
}
