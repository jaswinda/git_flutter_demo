import 'package:flutter/material.dart';
import 'package:git_flutter_demo/views/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () => add(), child: const Text("Add")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => SecondPage(
                              count: count,
                              superAdd: add,
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

  add() {
    count++;
    setState(() {});
    print(count);
  }
}
