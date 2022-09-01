import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  int count;
  final Function superAdd;
  SecondPage({Key? key, required this.count, required this.superAdd})
      : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var my_new_count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    my_new_count = widget.count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            my_new_count.toString(),
            style: const TextStyle(fontSize: 50),
          )),
          ElevatedButton(onPressed: () => add(), child: const Text("Add"))
        ],
      ),
    );
  }

  add() {
    my_new_count++;
    widget.superAdd();
    setState(() {});
    print(widget.count);
  }
}
