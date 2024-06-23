import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

String EndpointUrl = "api.pexels.com";

class HttpServes {
  static Map<String, String> headers = {
    "Authorization": "NMRN25SUisChNAZSIwLW93ynNK2XVDTiEJ6s1pNIZKt0yMS7YM1z37lT",
  };

  static Future<MyResponse> GET(String path,
      {Map<String, dynamic>? param}) async {
    var url = Uri.https(EndpointUrl, path, param);
    try {
      var res = await http.get(url, headers: headers);
      //print(res.body);
      if (res.statusCode == 200) {
        return MyResponse(
          data: jsonDecode(res.body),
          status: MyResponseStatus.success,
        );
      } else {
        return MyResponse(
          data: jsonDecode(res.body),
          status: MyResponseStatus.error,
        );
      }
    } catch (e) {
      print("${e}");
      return MyResponse(
        status: MyResponseStatus.uncnown,
        data: {"msg": e},
      );
    }
  }
}

class MyResponse {
  final MyResponseStatus status;
  final dynamic data;

  MyResponse({required this.status, required this.data});
}

enum MyResponseStatus { success, error, uncnown }
