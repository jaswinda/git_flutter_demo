import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/controllers/product_controller.dart';
import 'package:git_flutter_demo/utils/api.dart';

class Home extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: productController.products
                  .map((e) => Column(
                        children: [
                          SizedBox(
                              height: 200,
                              child: Image.network(BASE_URL + e["image"])),
                          Text(e["description"]),
                        ],
                      ))
                  .toList(),
            )),
      ),
    );
  }
}
