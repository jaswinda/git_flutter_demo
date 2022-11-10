import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/controllers/cart_controller.dart';
import 'package:git_flutter_demo/views/conponents/product_component.dart';

import '../../models/product.dart';

class Cart extends StatelessWidget {
  final CartController cartController = Get.find();
  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: cartController.cart.values
              .map((Product e) => ProductComponent(product: e))
              .toList(),
        ));
  }
}
