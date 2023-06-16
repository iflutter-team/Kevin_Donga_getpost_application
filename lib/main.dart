import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modeldemo/screen/home_screen/home_screen.dart';
import 'package:modeldemo/services/pref_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PrefServices.init();
  runApp(const GetMaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
