import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modeldemo/model/model_user.dart';
import 'package:modeldemo/screen/home_screen/home_screen.dart';
import 'package:modeldemo/services/firebase_services.dart';
import 'package:modeldemo/utils/firebase_res.dart';

import '../signup_screen/signup_screen.dart';

class LoginScreenController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> loginonPressed() async {
    Map? allData = await FirebaseServices.getData(FirebaseRes.addFirebaseRes);
    List<User>? userList;
    List<Map<String, dynamic>> userJsonList = [];
    if (allData!.isNotEmpty) {
      print(allData);

      allData.forEach((key, value) {
        Map<String, dynamic> userData = {};
        value["id"] = key;

        value.forEach((key1, value) {
          print(value);
          userData[key1.toString()] = value;
          print(userData);
        });

        print(userData);
        userJsonList.add(userData);
      });

      userList = getUserList(jsonEncode(userJsonList));

      print(userList[0].email);
      // userList!.add(User.fromJson(userData));
      bool value2 = userList.any((element) =>
          element.name == username.text && element.password == password.text);
      if (value2) {
        Get.off(const Home());
      } else {
        Get.snackbar("Login Failed", "Enter Valid Data",
            backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
      }
    }

    // String userString = PrefServices.getString(PrefRes.userList);
    // if (userString == '') {
    //   Get.snackbar("Login Failed", "Please SignUp",
    //       backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    // } else {
    //   List<User> userList = getUserList(userString);
    //   bool value = userList.any((element) =>
    //       element.name == username.text && element.password == password.text);
    //   if (value) {
    //     PrefServices.setValue(PrefRes.isSignup, true);
    //     Get.offAll(const Home());
    //   } else {
    //     Get.snackbar("Login Failed", "Enter Valid Data",
    //         backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    //   }
    // }
  }

  void onTapSignup() {
    Get.to(const SignupScreen());
  }
}
