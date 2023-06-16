import 'package:http/http.dart' as http;
import 'package:modeldemo/model/model_test.dart';
import 'package:modeldemo/utils/endpoint_res.dart';

import '../../services/htttp_services.dart';

class HomeScreenApi {
  static Future getData() async {
    try {
      http.Response? response =
          await HttpServices.getApi(url: EndpointRes.productAPI);
      if (response != null && response.statusCode == 200) {
        return productAPIFromJson(response.body);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  // static Future addData() async {
  //   try {
  //     http.Response? response =
  //         await HttpServices.postApi(url: EndpointRes.productAPI);
  //     if (response != null && response.statusCode == 200) {
  //       return productAPIFromJson(response.body);
  //     }
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }
}
