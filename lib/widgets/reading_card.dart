import 'package:flutter/material.dart';
import 'package:substation_app/constants/constant.dart';

const inActiveCardColor = Color(0xFFF9FAFC);
const activeCardColor = Color(0xFF343150);

class ReadingCard extends StatelessWidget {
  ReadingCard({this.reading, this.status, this.fontW, this.onPressed});
  final String reading;
  final String status;
  final FontWeight fontW;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(reading, style: kNamestyle),
            ),
            Center(
              child: Text(
                status,
                style: TextStyle(
                    color: activeCardColor,
                    letterSpacing: 0.5,
                    fontFamily: 'Quicksand',
                    fontWeight: fontW,
                    fontSize: 16.0),
              ),
            ),
            FlatButton.icon(
                onPressed: onPressed,
                icon: Icon(
                  Icons.add,
                  size: 30.0,
                ),
                label: Text('Take Readings'))
          ],
        ),
        // margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        // height: 110.0,
        decoration: BoxDecoration(
            color: inActiveCardColor,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10.0)]),
      ),
    );
  }
}
