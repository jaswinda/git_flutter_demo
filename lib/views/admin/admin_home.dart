import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/controllers/authentication_controller.dart';
import 'package:git_flutter_demo/views/admin/components/admin_button.dart';
import 'package:git_flutter_demo/views/admin/pages/category_page.dart';
import 'package:git_flutter_demo/views/admin/pages/product_page.dart';

class AdminHome extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.find<AuthenticationController>();
  AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Admin Home'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(children: [
            AdminButton(
              onTap: () => Get.to(() => const Categories()),
              icon: Icons.pages_outlined,
            ),
            AdminButton(
              onTap: () => Get.to(() => const Product()),
              icon: Icons.home,
              title: "Product",
            ),
            AdminButton(
              onTap: () => authenticationController.signOut(),
              icon: Icons.home,
              title: "Logout",
            ),
          ]),
        ),
      ),
    );
  }
}
