import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/controllers/cart_controller.dart';
import 'package:git_flutter_demo/utils/api.dart';

import '../../models/product.dart';

class ProductComponent extends StatelessWidget {
  final Product product;
  final CartController cartController = Get.find();
  ProductComponent({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: Get.width / 2,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(
                        height: 200,
                        child: Image.network("$BASE_URL/${product.image}")),
                    Text(product.description),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 0,
            right: 20,
            child: InkWell(
                onTap: () {
                  Get.bottomSheet(Container(
                    height: Get.height / 2,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                            height: 200,
                            child: Image.network("$BASE_URL/${product.image}")),
                        Text(product.description),
                        Text(product.price.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () => cartController.decrement(),
                                icon: const Icon(Icons.remove)),
                            Obx(() => Text(
                                  cartController.quantity.toString(),
                                  style: const TextStyle(fontSize: 20),
                                )),
                            IconButton(
                                onPressed: () => cartController.increment(),
                                icon: const Icon(Icons.add)),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              cartController.add(product);
                             
                            },
                            child: const Text('Add to cart'))
                      ],
                    ),
                  ));
                },
                child: const CircleAvatar(child: Icon(Icons.shopping_cart)))),
      ],
    );
  }
}
