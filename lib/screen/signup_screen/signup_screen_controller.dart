import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modeldemo/model/model_user.dart';

import '../../services/firebase_services.dart';
import '../../utils/firebase_res.dart';

class SignupScreenController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<void> signuponPressed() async {
    Map? allData = await FirebaseServices.getData(FirebaseRes.addFirebaseRes);
    List<User>? userList;
    List<Map<String, dynamic>> userJsonList = [];
    if (allData != null) {
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
          element.name == usernameController.text &&
          element.password == passController.text);
      if (value2) {
        Get.snackbar("Login Failed", "You Already Logged In",
            backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
        // Get.off(const Home());
      } else {
        if (formkey.currentState!.validate()) {
          Map<String, dynamic> user = {
            "name": usernameController.text,
            "email": emailController.text,
            "mobile": mobileController.text,
            "password": passController.text,
          };
          User userData = User.fromJson(user);
          bool isAddData = await FirebaseServices.addData(
              FirebaseRes.addFirebaseRes, userData.toJson());
          if (isAddData) {
            Get.back();
          } else {
            Get.snackbar("Signup Error", "Please Check Again",
                backgroundColor: Colors.red,
                snackPosition: SnackPosition.BOTTOM);
          }
          // String userString = PrefServices.getString(PrefRes.userList);
          //List<User> userList = [];
          // if (userString == '') {
          //   userList.add(userData);
          // } else {
          //   userList = getUserList(userString);
          //   userList.add(userData);
          // }
          // userString = userToJson(userList);
          // PrefServices.setValue(PrefRes.userList, userString);
          //  Get.back();
        } else {
          Get.snackbar("SignUp Error", "Enter valid data",
              backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
        }
      }
    }
  }
}
