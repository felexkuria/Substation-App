import 'package:flutter/material.dart';
import 'package:substation_app/screens/homescreen.dart';
import 'package:substation_app/models/sign_in.dart';
import 'package:substation_app/widgets/select_card.dart';
import 'package:substation_app/widgets/person_card.dart';

const inActiveCardColor = Color(0xFF3B1F83);
const activeCardColor = Color(0xFFFBFCFF);

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF585757),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Color(0xFFFBFCFF),
              size: 30.0,
            ),
            onPressed: () {
              signOutGoogle();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }), ModalRoute.withName('/'));
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                color: Color(0xFFFBFCFF),
                size: 30.0,
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(16.0),
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Color(0xFFFBFCFF),
                size: 30.0,
              ),
            )
          ],
          backgroundColor: Color(0xFF210472),
          title: Text(
            'Substation App',
            style: TextStyle(
              color: Color(0xFFFBFCFF),
              fontFamily: 'Pacifico',
              fontSize: 20.0,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PersonCard(
                    radii: 60.0,
                    font: 18.0,
                    name: 'Wycliffe Wanyama',
                    shift: 'OnShift',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  PersonCard(
                    radii: 35.0,
                    font: 18.0,
                    name: 'Felex Kuria',
                    shift: 'Rest',
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  PersonCard(
                    radii: 35.0,
                    font: 18.0,
                    name: 'Leonard',
                    shift: 'Rest',
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    // color: Color(0xFF3B1F83),
                    decoration: BoxDecoration(
                      color: Color(0xFF3B1F83),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Row(
                      children: [
                        /**Extract widget in their folder widget */
                        SelectCard(
                          time: 'Today',
                          color: activeCardColor,
                        ),
                        SelectCard(time: 'Month', color: inActiveCardColor),
                        SelectCard(time: 'Quarter', color: inActiveCardColor)
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    ' Pending Readings',
                    style: TextStyle(
                        color: activeCardColor,
                        letterSpacing: 1.2,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                ),
                Container(
                  height: 120.0,
                  decoration: BoxDecoration(
                      color: activeCardColor,
                      borderRadius: BorderRadius.circular(15.0),
                       boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 10.0)
                      ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
