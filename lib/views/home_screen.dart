import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final int count;
  const Home({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          count.toString(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ))
      ],
    ));
  }
}
