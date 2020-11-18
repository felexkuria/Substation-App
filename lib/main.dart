import 'package:flutter/material.dart';
import 'package:substation_app/screens/dashboard.dart';
import 'package:substation_app/screens/homescreen.dart';
import 'package:substation_app/screens/reading_screen.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context)=>HomeScreen(),
      '/dashboard':(context)=>DashBoard(),
      '/reading':(context)=>ReadingScreen(),
    },

  ));
}



