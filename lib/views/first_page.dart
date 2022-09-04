import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/controller/counter_controller.dart';
import 'package:git_flutter_demo/views/conponents/my_button.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);
  final counter = Get.put(Counter());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.accents[0],
          ),
          Container(
            height: 200,
            color: Colors.grey,
          ),
          Column(
            children: [
              Wrap(
                children: [
                  MyButton(
                      text: "1",
                      onPressed: () {
                        print("thicheko");
                      }),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
