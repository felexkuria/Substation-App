import 'package:flutter/material.dart';

class Worker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF343150),
      appBar: AppBar(
        backgroundColor: Color(0xFF3A3756),
        title: Text('Readings'),
      ),
      body: Hero(
        tag: 'wanyama',
        child: Image(
          image: AssetImage("assets/images/wycliffe.jpg"),
        ),
      ),
    );
  }
}
