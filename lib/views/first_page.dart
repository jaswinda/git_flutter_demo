import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/controller/counter_controller.dart';

import 'second_page.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);
  final counter = Get.put(Counter());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Center(child: Text(counter.count.toString()))),
          ElevatedButton(
              onPressed: () => counter.increment(),
              child: const Text("Increment")),
          ElevatedButton(
              onPressed: () {
                Get.to(SecondPage());
              },
             )
        ],
      ),
    );
  }
}
