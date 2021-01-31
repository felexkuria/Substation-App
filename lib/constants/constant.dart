import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:substation_app/widgets/reading_card.dart';

const kNamestyle = TextStyle(
    color: activeCardColor,
    letterSpacing: 1.0,
    fontFamily: 'Quicksand',
    fontWeight: FontWeight.bold,
    fontSize: 18.0);
const kLabelTextStyle = TextStyle(
    color: Color(0xFFFBFCFF), fontSize: 18.0, fontWeight: FontWeight.w600);
const kInputdecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    prefixIcon: Icon(
      Icons.wb_incandescent,
      color: Colors.redAccent,
      size: 30.0,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
      borderSide: BorderSide(width: 0.8),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
      borderSide: BorderSide(width: 0.8, color: activeCardColor),
    ),
    hintText: 'Enter Active Power');
const kReactivedecoration = InputDecoration(
  prefixIcon: Icon(
    Icons.ac_unit,
    color: Colors.blueAccent,
    size: 30.0,
  ),
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter Reactive Power',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30.0),
    ),
    borderSide: BorderSide(width: 0.8),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30.0),
    ),
    borderSide: BorderSide(width: 0.8, color: activeCardColor),
  ),
);
