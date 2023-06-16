import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpServices {
  static Future<http.Response?> getApi({required String url}) async {
    try {
      if (kDebugMode) {
        print(url);
      }
      return await http.get(Uri.parse(url));
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<http.Response?> postApi({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      return await http.post(Uri.parse(url), body: body);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
