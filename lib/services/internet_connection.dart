import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetConnection {
  static Future<bool> checkUserConnection() async {
    bool activeConnection = false;
    try {
      final result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        activeConnection = true;
      }
    } on SocketException catch (_) {
      activeConnection = false;
      Get.snackbar("connection Error", "Turn On internet",
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    }
    return activeConnection;
  }
}
