import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/utils/api.dart';

import '../../models/product.dart';

class ProductComponent extends StatelessWidget {
  final Product product;
  const ProductComponent({Key? key, required this.product}) : super(key: key);

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
        const Positioned(
            top: 0,
            right: 20,
            child: CircleAvatar(child: Icon(Icons.shopping_cart))),
      ],
    );
  }
}
