import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/controllers/cart_controller.dart';
import 'package:git_flutter_demo/controllers/order_controller.dart';
import 'package:git_flutter_demo/utils/api.dart';
import 'package:git_flutter_demo/views/payment/khalti.dart';

import '../../models/product.dart';

class Cart extends StatelessWidget {
  final CartController cartController = Get.find();
  final OrderController orderController = Get.find();
  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: cartController.cart.values
                      .map((Product product) => Container(
                            child: ListTile(
                              leading:
                                  Image.network("$BASE_URL/${product.image}"),
                              title: Text(product.description),
                              subtitle: Text(
                                "${product.price} x ${product.quantity} = ${int.parse(product.price) * int.parse(product.quantity.toString())}",
                              ),
                              trailing: IconButton(
                                  onPressed: () =>
                                      cartController.remove(product),
                                  icon: const Icon(Icons.delete)),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            Container(
              color: Colors.black,
              width: Get.width,
              child: TextButton(
                onPressed: () {
                  Get.to(const KhaltiPayment());
                },
                child: Text(
                  "Place Order Rs${cartController.total.value}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}
