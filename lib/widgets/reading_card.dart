import 'package:flutter/material.dart';

const inActiveCardColor = Color(0xFFF9FAFC);
const activeCardColor = Color(0xFF343150);

class ReadingCard extends StatelessWidget {
  ReadingCard({this.reading});
  final String reading;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              reading,
              style: TextStyle(
                  color: activeCardColor,
                  letterSpacing: 1.0,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 8.0),
      height: 120.0,
      decoration: BoxDecoration(
          color: inActiveCardColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10.0)]),
    );
  }
}
