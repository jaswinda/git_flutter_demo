import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/controllers/authentication_controller.dart';
import 'package:git_flutter_demo/views/pages/auth_checker.dart';

void main() {
  Get.put(AuthenticationController());
  runApp(const GetMaterialApp(home: AuthChecker()));
}
