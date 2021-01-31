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
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Hero(
                tag: 'wanyama',
                child: CircleAvatar(
                  radius: 120.0,
                  backgroundImage: AssetImage("assets/images/wycliffe.jpg"),
                ),
              ),
            ),
          ),
          Text(
            'Wyclifffe Wanyama',
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Color(0xFFFFFFFF)),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
