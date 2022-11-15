import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/controllers/authentication_controller.dart';
import 'package:git_flutter_demo/views/pages/auth_checker.dart';
import 'package:khalti/khalti.dart';

import 'controllers/cart_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Khalti.init(
    publicKey: 'test_public_key_f87d48757c214fbd912bc7974b2996e1',
    enabledDebugging: false,
  );
  Get.put(AuthenticationController());
  Get.put(CartController());

  runApp(const GetMaterialApp(home: AuthChecker()));
}
