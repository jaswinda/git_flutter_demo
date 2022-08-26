import 'package:flutter/material.dart';
import 'package:git_flutter_demo/views/home_screen.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                count++;
                setState(() {});
                print(count);
              },
              child: const Text("Add")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Home(
                              count: count,
                            ))));
              },
              child: const Text("Go to next page")),

          Center(
              child: Text(
            count.toString(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ))
          // TextField(
          //     decoration:
          //         InputDecoration(icon: Icon(Icons.email), prefixText: "Email"))
        ],
      ),
    ));
  }
}
