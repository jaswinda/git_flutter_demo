import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminButton extends StatelessWidget {
  final Function? onTap;
  final String title;
  const AdminButton({Key? key, this.onTap, this.title = "Add Category"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: Get.width / 3 - 10,
      child: InkWell(
        onTap: () => onTap,
        child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: const Color.fromARGB(255, 118, 113, 113), width: 2),
            ),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ))),
      ),
    );
  }
}
