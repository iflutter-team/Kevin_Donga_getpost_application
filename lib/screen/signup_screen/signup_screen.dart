import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modeldemo/screen/signup_screen/signup_screen_widget.dart';

import '../../common_widget/commonTextField.dart';
import '../../common_widget/elevated_button.dart';
import 'signup_screen_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignupScreenController());
    double h = Get.height;
    double w = Get.width;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: GetBuilder<SignupScreenController>(builder: (controller) {
          return Form(
            key: controller.formkey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              commonTextField(
                  width: w * 0.893,
                  height: h * 0.067,
                  controller: controller.usernameController,
                  validator: (val) => usernameValidate(val!),
                  hintTextString: "Username"),
              SizedBox(height: h * 0.0299),
              commonTextField(
                  width: w * 0.893,
                  height: h * 0.067,
                  controller: controller.emailController,
                  hintTextString: "Email"),
              SizedBox(height: h * 0.0299),
              commonTextField(
                  width: w * 0.893,
                  height: h * 0.067,
                  controller: controller.mobileController,
                  hintTextString: "Mobile"),
              SizedBox(height: h * 0.0299),
              commonTextField(
                  width: w * 0.893,
                  height: h * 0.067,
                  controller: controller.passController,
                  hintTextString: "password"),
              SizedBox(height: h * 0.09),
              commonBottomLoginORSignUpButton(
                  leftPadding: w * 0.32,
                  rightPadding: w * 0.32,
                  topPadding: h * 0.02,
                  bottomPadding: h * 0.02,
                  onPressed: () => controller.signuponPressed(),
                  buttonText: "SignUp"),
              SizedBox(height: h * 0.0299),
            ]),
          );
        }),
      ),
    );
  }
}
