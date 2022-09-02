import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/controller/counter_controller.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);
  final counter = Get.find<Counter>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Center(child: Text(counter.count.toString()))),
          ElevatedButton(
              onPressed: () => counter.increment(),
              child: const Text("Increment"))
        ],
      ),
    );
  }
}
