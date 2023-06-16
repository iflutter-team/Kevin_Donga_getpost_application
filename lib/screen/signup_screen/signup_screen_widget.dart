import 'package:get/get.dart';
import 'package:modeldemo/screen/signup_screen/signup_screen_controller.dart';

SignupScreenController controller = Get.put(SignupScreenController());

String? usernameValidate(String val) {
  if (controller.usernameController.text.isEmpty) {
    return 'Please enter Username';
  } else {
    return null;
  }
}

String? emailValidate(String val) {
  if (controller.emailController.text.isEmpty) {
    return 'Please enter email';
  } else {
    return null;
  }
}

String? mobileValidate(String val) {
  if (controller.mobileController.text.isEmpty) {
    return 'Please enter mobile number';
  } else {
    return null;
  }
}

String? passwordValidate(String val) {
  if (controller.passController.text.isEmpty) {
    return 'Please enter password';
  } else {
    return null;
  }
}
