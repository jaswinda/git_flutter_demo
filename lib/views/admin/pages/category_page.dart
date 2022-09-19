import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/views/admin/components/admin_button.dart';
import 'package:git_flutter_demo/views/conponents/custom_text_field.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          AdminButton(
              onTap: () {
                Get.bottomSheet(
                  Container(
                    height: 200,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          label: 'Category Name',
                          controller: TextEditingController(),
                          validator: (value) {
                            if (!value!.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("submit"))
                      ],
                    ),
                  ),
                );
              },
              icon: Icons.add),
          const Center(
            child: Text('Categories'),
          ),
        ],
      ),
    );
  }
}
