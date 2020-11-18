import 'package:flutter/material.dart';
import 'package:substation_app/screens/homescreen.dart';
import 'package:substation_app/services/sign_in.dart';

import 'package:substation_app/widgets/reading_card.dart';
import 'package:substation_app/widgets/select_card.dart';
import 'package:substation_app/widgets/person_card.dart';

enum Time { month, today, quarter }

const inActiveCardColor = Color(0xFFF9FAFC);
const activeCardColor = Color(0xFF3A3756);
// const selectorCardColor =Color(0xFF343150);  Color(0xFF343150)

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Time selectedTime;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF343150),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Color(0xFFFBFCFF),
              size: 30.0,
            ),
            onPressed: () {

              // signOutGoogle();
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (context) {
              //   return HomeScreen();
              // }), ModalRoute.withName('/'));
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
          backgroundColor: Color(0xFF3A3756),
          elevation: 5.0,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PersonCard(
                  radii: 60.0,
                  font: 18.0,
                  name: 'Wycliffe Wanyama',
                  shift: 'OnShift',
                  profile: AssetImage('assets/images/wycliffe.jpg'),
                ),
                SizedBox(
                  width: 10.0,
                ),
                PersonCard(
                  radii: 35.0,
                  font: 18.0,
                  name: 'Felex Kuria',
                  profile: AssetImage('assets/images/profile.jpg'),
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
                  profile: AssetImage('assets/images/leonard.jpg'),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(

                        // color: Color(0xFF3B1F83),
                        margin: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),

                        decoration: BoxDecoration(
                          color: inActiveCardColor,
                          // Color(0xFF3A3756)
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Row(
                          children: [
                            /**Extract widget in their folder widget */
                            SelectCard(
                              time: "Today",
                              color: selectedTime == Time.today
                                  ? activeCardColor
                                  : inActiveCardColor,
                              fontColor: selectedTime == Time.today
                                  ? inActiveCardColor
                                  : activeCardColor,
                              onPressed: () {
                                setState(() {
                                  selectedTime = Time.today;
                                });
                              },
                            ),
                            SelectCard(
                              time: "Month",
                              color: selectedTime == Time.month
                                  ? activeCardColor
                                  : inActiveCardColor,
                              fontColor: selectedTime == Time.month
                                  ? inActiveCardColor
                                  : activeCardColor,
                              onPressed: () {
                                setState(() {
                                  selectedTime = Time.month;
                                });
                              },
                            ),
                            SelectCard(
                              time: "Quarter",
                              color: selectedTime == Time.quarter
                                  ? activeCardColor
                                  : inActiveCardColor,
                              fontColor: selectedTime == Time.quarter
                                  ? inActiveCardColor
                                  : activeCardColor,
                              onPressed: () {
                                setState(() {
                                  selectedTime = Time.quarter;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    ' Pending Readings',
                    style: TextStyle(
                        color: inActiveCardColor,
                        letterSpacing: 1.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0),
                  ),
                ),
                ReadingCard(
                  reading: '0800Hrs Reading',
                  status: 'FINISHED',
                  fontW: FontWeight.bold,
                  onPressed: (){
                    Navigator.pushNamed(context, '/reading');
                  },


                ),
                ReadingCard(
                  reading: '1400Hrs Reading',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
                  onPressed: (){
                    Navigator.pushNamed(context, '/reading');
                  },
                ),
                ReadingCard(
                  reading: '2000Hrs Reading',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
                  onPressed: (){
                    Navigator.pushNamed(context, '/reading');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
