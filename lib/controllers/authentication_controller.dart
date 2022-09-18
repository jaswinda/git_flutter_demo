import 'dart:convert';

import 'package:get/get.dart';
import 'package:git_flutter_demo/service/auth_service.dart';
import 'package:git_flutter_demo/views/pages/auth_checker.dart';
import 'package:http/http.dart' as http;
import 'package:git_flutter_demo/utils/api.dart';

class AuthenticationController extends GetxController {
  AuthService authService = AuthService();
  var isLoading = false.obs;

  signUp(data) async {
    var url = Uri.parse(SIGNUP_API);
    var response = await http.post(url, body: data);
    var result = jsonDecode(response.body);
    var success = result['success'];
    if (success) {
      Get.snackbar("Success", result['message']);
    } else {
      Get.snackbar("Error", result['message']);
    }
  }

  signIn(data) async {
    isLoading.value = true;
    var url = Uri.parse(SIGNIN_API);
    var response = await http.post(url, body: data);
    var result = jsonDecode(response.body);

    var success = result['success'];
    if (success) {
      var token = result['token'];
      var isAdmin = result['isAdmin'];
      print(token);
      await authService.savetoken(token, isAdmin: isAdmin);
      Get.snackbar("Success", result['message']);
      Get.to(const AuthChecker());
    } else {
      Get.snackbar("Error", result['message']);
    }
    isLoading.value = false;
  }

  signOut() async {
    await authService.removeToken();
    Get.to(const AuthChecker());
  }
}
