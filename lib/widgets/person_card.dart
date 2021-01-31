import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  PersonCard(
      {this.radii,
      this.font,
      this.name,
      this.shift,
      this.profile,
      this.onPressed,
      @required this.taf});
  final double radii;
  final double font;
  final String name;
  final String shift;
  final AssetImage profile;
  final Function onPressed;
  final Object taf;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Hero(
            tag: taf,
            child: CircleAvatar(
              radius: radii,
              foregroundColor: Color(0xFFFFFFFF),
              backgroundImage: profile,
            ),
          ),
          Text(
            name,
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Color(0xFFFFFFFF)),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            shift,
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w100,
                fontSize: 20.0,
                letterSpacing: 1.2,
                color: Color(0xFFFFFFFF)),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
