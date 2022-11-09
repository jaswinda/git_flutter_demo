import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/controllers/product_controller.dart';
import 'package:git_flutter_demo/views/conponents/product_component.dart';

import '../../../models/product.dart';

class Home extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() => Wrap(
                children: productController.products
                    .map(
                        (Product product) => ProductComponent(product: product))
                    .toList(),
              )),
        ),
      ),
    );
  }
}
