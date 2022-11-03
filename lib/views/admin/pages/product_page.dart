import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/views/admin/components/add_category.dart';
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
              title: "Add Product",
              onTap: () {
                Get.bottomSheet(AddCategory(
                    nameController: TextEditingController(),
                    descriptionController: TextEditingController()));
              },
              icon: Icons.add),
          const Center(
            child: Text('Prouduts'),
          ),
        ],
      ),
    );
  }
}
