import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  ResultCard({this.result, this.date, this.panel, this.reading});
  final String result;
  final String date;
  final String panel;
  final TextStyle reading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            date,
            //widget.result1980.substring(0, 7),

            style: reading,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            panel,
            //widget.result660.substring(0, 7),
            style: reading,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            result,
            //widget.result.substring(0, 7),
            style: reading,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
