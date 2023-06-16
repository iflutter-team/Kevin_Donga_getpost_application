import 'package:get/get.dart';
import 'package:modeldemo/screen/home_screen/home_screen_api.dart';
import 'package:modeldemo/screen/login_screen/login_screen.dart';
import 'package:modeldemo/services/pref_services.dart';

import '../../model/model_test.dart';

class HomeController extends GetxController {
  void logOut() {
    PrefServices.deletePref();
    Get.offAll(const LoginScreen());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getProductList();
    super.onInit();
    //getImageList();
  }

  // List<Welcome>? imageList = [];

  // Future<void> getImageList() async {
  //   imageList = await HomeScreenApi.getData();
  //   print(imageList);
  //   update(['userlist']);
  // }

  WelcomeProduct? productList;

  Future<void> getProductList() async {
    update(['userproductlist']);
    productList = await HomeScreenApi.getData();
    print(productList);
    update(['userproductlist']);
  }
}
