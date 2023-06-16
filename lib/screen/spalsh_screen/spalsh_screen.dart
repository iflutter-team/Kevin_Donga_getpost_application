import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modeldemo/screen/home_screen/home_screen.dart';
import 'package:modeldemo/services/pref_services.dart';

import '../../common_widget/commonText.dart';
import '../../utils/pref_resorces.dart';
import '../../utils/string_res.dart';
import '../login_screen/login_screen.dart';
import 'spalsh_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool isLogin = PrefServices.getBoolean(PrefRes.isSignup);
    Timer(const Duration(seconds: 3), () {
      Get.off(isLogin ? const Home() : const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: commonText(
            text: StringRes.splashText,
            color: Colors.green,
            fontSize: 23,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
