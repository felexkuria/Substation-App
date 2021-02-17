import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const inActiveCardColor = Color(0xFFF9FAFC);
const activeCardColor = Color(0xFF3A3756);

const kNamestyle = TextStyle(
    color: Color(0xFF20BFA9),
    letterSpacing: 1.0,
    fontFamily: 'Quicksand',
    fontWeight: FontWeight.bold,
    fontSize: 18.0);
const kLabelTextStyle = TextStyle(
    color: Color(0xFFFBFCFF), fontSize: 18.0, fontWeight: FontWeight.w600);
const kInputdecoration = InputDecoration(
  suffixIcon: IconButton(
    icon: Icon(
      Icons.clear,
      color: Color(0xFF070707),
    ),
    onPressed: null,
  ),
  filled: true,
  fillColor: Colors.white,
  prefixIcon: Icon(
    Icons.wb_incandescent,
    color: Color(0xFF070707),
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
  hintText: 'Enter N3(Active Power) Prev Readings',
  hintStyle: TextStyle(
    color: Color(0xFF070707),
  ),
);
const kInputdecoration1 = InputDecoration(
  suffixIcon: IconButton(
    icon: Icon(
      Icons.clear,
      color: Color(0xFF070707),
    ),
    onPressed: null,
  ),
  labelText: 'Enter Previous Readings',
  filled: true,
  fillColor: Colors.white,
  prefixIcon: Icon(
    Icons.wb_incandescent,
    color: Color(0xFF070707),
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
  hintText: 'Enter N3(Active Power) Current Readings',
  hintStyle: TextStyle(
    color: Color(0xFF070707),
  ),
);
const kReactivedecoration = InputDecoration(
  labelText: 'Enter Current Readings',
  prefixIcon: Icon(
    Icons.ac_unit,
    color: Color(0xFF070707),
    size: 30.0,
  ),
  suffixIcon: IconButton(
    icon: Icon(
      Icons.clear,
      color: Color(0xFF070707),
    ),
    onPressed: null,
  ),
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter N3(Reactive Power) Current Readings',
  hintStyle: TextStyle(
    color: Color(0xFF070707),
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
);
const kReactivedecoration1 = InputDecoration(
  labelText: 'Enter Current Readings',
  prefixIcon: Icon(
    Icons.ac_unit,
    color: Color(0xFF070707),
    size: 30.0,
  ),
  suffixIcon: IconButton(
    icon: Icon(
      Icons.clear,
      color: Color(0xFF070707),
    ),
    onPressed: null,
  ),
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter N3(Reactive Power) Prev Readings',
  hintStyle: TextStyle(
    color: Color(0xFF070707),
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
);
const kTimedecoration = InputDecoration(
  labelText: 'Select Time  Dont please OK without Selecting',
  prefixIcon: Icon(
    Icons.alarm,
    color: Colors.black,
  ),
  filled: true,
  fillColor: Colors.white,
  hintText: 'Select Time ',
  hintStyle: TextStyle(color: Colors.black),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30.0),
    ),
    borderSide: BorderSide(
      width: 0.8,
      color: activeCardColor,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30.0),
    ),
    borderSide: BorderSide(width: 0.8, color: activeCardColor),
  ),
);
const kReadingStyle = TextStyle(
  fontFamily: 'Quicksand',
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.2,
  color: Color(0xFF20BFA9),
);
const kDataStyle = TextStyle(
  fontFamily: 'Quicksand',
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.2,
  color: Colors.white,
);
