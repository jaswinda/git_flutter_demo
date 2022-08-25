import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  color: Colors.red,
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      color: Colors.black,
                    ),
                  ),
                ],
              ))
            ],
          ),
          Wrap(
            children: [
              Container(
                height: 200,
                width: 200,
                color: Colors.blue,
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.black,
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.blue,
              ),
            ],
          ),
          Container(
            height: 200,
            color: Colors.red,
          ),
          Container(
            height: 200,
            color: Colors.black,
          ),
          Container(
            height: 200,
            color: Colors.red,
          ),
          Container(
            height: 200,
            color: Colors.black,
          ),
        ],
      ),
    ));
  }
}
