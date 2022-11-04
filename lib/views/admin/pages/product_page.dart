import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/views/admin/components/add_product.dart';
import 'package:git_flutter_demo/views/admin/components/admin_button.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          AdminButton(
            icon: Icons.add,
            title: "Add Product",
            onTap: () {
              Get.to(() => const AddEditProductForm());
            },
          ),
          const Center(
            child: Text('Prouduts'),
          ),
        ],
      ),
    );
  }
}
