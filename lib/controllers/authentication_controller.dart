import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:git_flutter_demo/utils/api.dart';

class AuthenticationController extends GetxController {
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
}
