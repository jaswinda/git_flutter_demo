import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/service/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:git_flutter_demo/utils/api.dart';

class ProductController extends GetxController {
  AuthService authService = AuthService();
  var isLoading = false.obs;

  add(data) async {
    var token = await authService.getToken();
    data["token"] = token;
    isLoading.value = true;
    var url = Uri.parse(ADD_CATEGORY_API);
    var response = await http.post(url, body: data);
    var result = jsonDecode(response.body);
    var success = result['success'];
    if (success) {
      Get.snackbar("Success", result['message'],
          colorText: Colors.white, backgroundColor: Colors.green);
    } else {
      Get.snackbar("Error", result['message'],
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }
}
