import 'package:flutter/material.dart';

class SelectCard extends StatelessWidget {
  SelectCard({this.time, this.color});
  final String time;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20.0,
                  letterSpacing: 1.2,
                  color: Color(0xFF3B1F83)),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
