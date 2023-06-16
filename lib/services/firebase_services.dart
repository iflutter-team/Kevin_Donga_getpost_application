import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'internet_connection.dart';

class FirebaseServices {
  static FirebaseDatabase database = FirebaseDatabase.instance;

  static Future<bool> addData(String add, dynamic value) async {
    bool isAddData = false;

    bool connection = await InternetConnection.checkUserConnection();
    if (connection) {
      try {
        String? key = database.ref(add).push().key;
        add = "${add}/${key}";
        if (kDebugMode) {
          print(add);
        }
        DatabaseReference _firebaseRef = database.ref(add);
        await _firebaseRef.set(value).then((value) => isAddData = true);
      } on PlatformException catch (error, stackTrace) {
        print(stackTrace);
        isAddData = false;
        Get.snackbar("SignUp Error", error.message!,
            backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
      } catch (e) {
        Get.snackbar("SignUp Error", "$e",
            backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
        isAddData = false;
      }
    } else {
      Get.snackbar("Network Error", 'check Internet',
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    }
    return isAddData;
  }

  static Future<Map?> getData(String add) async {
    Map? allaData;
    bool connection = await InternetConnection.checkUserConnection();
    if (connection) {
      try {
        DatabaseReference reference = database.ref(add);
        await reference.get().then((value) {
          if (value.value != null) {
            allaData = value.value as Map;
            print(value);
          } else {
            allaData = {};
          }
        });
      } on PlatformException catch (error, stackTrace) {
        print(stackTrace);
        Get.snackbar("data Error", error.message!,
            backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
      } catch (e) {
        Get.snackbar("data Error", "$e",
            backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar("Network Error", 'check Internet',
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    }
    return allaData;
  }
}
