import 'dart:convert';
import 'package:flutter/services.dart';

class MockApi {
  static Map<String, String> mapMockApi = {
    // EndPoints.login: 'login',
    // EndPoints.home: 'home',
  };

  static Future<Map<String, dynamic>?> get(String endpoint) async {
    return mock(endpoint: getJsonName(endpoint));
  }

  static String? getJsonName(String endpoint) {
    return mapMockApi[endpoint];
  }

  static Future<Map<String, dynamic>?> mock({String? endpoint}) async {
    // the way how to load assets in packages
    final responseStr =
        await rootBundle.loadString('assets/mockups/$endpoint.json');
    final responseJson = json.decode(responseStr) as Map<String, dynamic>?;
    return responseJson;
  }
}
