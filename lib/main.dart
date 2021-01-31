import 'package:flutter/material.dart';
import 'package:substation_app/screens/dashboard.dart';
import 'package:substation_app/screens/homescreen.dart';
import 'package:substation_app/screens/reading_screen.dart';
import 'package:substation_app/screens/worker.dart';
import 'package:substation_app/widgets/reading_card.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color(0xFF3A3756),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(),
      '/dashboard': (context) => DashBoard(),
      '/reading': (context) => ReadingScreen(),
      'worker': (context) => Worker(),
    },
  ));
}
