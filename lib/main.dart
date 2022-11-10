import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/controllers/authentication_controller.dart';
import 'package:git_flutter_demo/views/pages/auth_checker.dart';

import 'controllers/cart_controller.dart';

void main() {
  Get.put(AuthenticationController());
  Get.put(CartController());
  runApp(const GetMaterialApp(home: AuthChecker()));
}
