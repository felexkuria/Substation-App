import 'package:flutter/material.dart';

class SelectCard extends StatelessWidget {
  SelectCard({@required this.time, this.color, this.fontColor, this.onPressed});
  final String time;
  final Color color;
  final Color fontColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                time,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20.0,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w300,
                    color: fontColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}
