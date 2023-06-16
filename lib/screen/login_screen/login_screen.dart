import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/commonText.dart';
import '../../common_widget/commonTextField.dart';
import '../../common_widget/elevated_button.dart';
import 'login_screen_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginScreenController());
    double h = Get.height;
    double w = Get.width;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: GetBuilder<LoginScreenController>(builder: (controller) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            commonTextField(
                width: w * 0.893,
                height: h * 0.067,
                controller: controller.username,
                hintTextString: "Username"),
            SizedBox(height: h * 0.0299),
            commonTextField(
                width: w * 0.893,
                height: h * 0.067,
                controller: controller.password,
                hintTextString: "password"),
            SizedBox(height: h * 0.09),
            commonBottomLoginORSignUpButton(
                leftPadding: w * 0.32,
                rightPadding: w * 0.32,
                topPadding: h * 0.02,
                bottomPadding: h * 0.02,
                onPressed: controller.loginonPressed,
                buttonText: "Login"),
            SizedBox(height: h * 0.0299),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                commonText(
                    text: 'New User? ', fontSize: 17, color: Colors.white),
                SizedBox(width: w * 0.014),
                GestureDetector(
                  onTap: controller.onTapSignup,
                  child: commonText(
                      text: 'Sign Up',
                      color: Colors.orange,
                      fontSize: 20,
                      decoration: TextDecoration.underline),
                )
              ],
            ),
          ]);
        }),
      ),
    );
  }
}
