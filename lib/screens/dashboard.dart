import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:substation_app/widgets/person_card.dart';

import 'package:substation_app/widgets/reading_card.dart';
import 'package:substation_app/widgets/select_card.dart';

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
  DateTime _date = DateTime.now();

  final DateFormat _dateFormatter = DateFormat.yMMMMEEEEd();
  void _handleDatetime() async {
    final DateTime dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2035),
    );
    if (dateTime != null && dateTime != _date) {
      setState(() {
        _date = dateTime;
      });
    }
  }

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
              onPressed: () {
                Navigator.pushNamed(context, 'worker');
              },
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
                  onPressed: () {
                    Navigator.pushNamed(context, 'worker');
                  },
                  radii: 40.0,
                  font: 18.0,
                  name: 'Wycliffe Wanyama',
                  shift: 'OnShift',
                  profile: AssetImage('assets/images/wycliffe.jpg'),
                  taf: 'wanyama',
                ),
                SizedBox(
                  width: 10.0,
                ),
                PersonCard(
                  onPressed: () {
                    Navigator.pushNamed(context, 'worker');
                  },
                  radii: 35.0,
                  font: 18.0,
                  name: 'Felex Kuria',
                  profile: AssetImage('assets/images/profile.jpg'),
                  shift: 'Rest',
                  taf: 'Felex',
                ),
                SizedBox(
                  width: 10.0,
                ),
                PersonCard(
                  onPressed: () {
                    Navigator.pushNamed(context, 'worker');
                  },
                  radii: 35.0,
                  font: 18.0,
                  name: 'Leonard',
                  shift: 'Rest',
                  profile: AssetImage('assets/images/leonard.jpg'),
                  taf: 'Leonard',
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
                              time: _dateFormatter.format(_date),
                              color: selectedTime == Time.today
                                  ? activeCardColor
                                  : inActiveCardColor,
                              fontColor: selectedTime == Time.today
                                  ? inActiveCardColor
                                  : activeCardColor,
                              onPressed: () {
                                setState(() {
                                  selectedTime = Time.today;
                                  _handleDatetime();
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
                // ListView.builder(
                //   itemCount: 2,
                //   itemBuilder: (BuildContext context, int index) {
                //     if (index == 0)
                //       return Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 20.0),
                //         child:
                //       );

                SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        _dateFormatter.format(_date),
                        style: TextStyle(
                            color: inActiveCardColor,
                            letterSpacing: 1.0,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ReadingCard(
                        reading: '0800Hrs Reading',
                        status: 'PENDING',
                        fontW: FontWeight.w300,
                        onPressed: () {
                          Navigator.pushNamed(context, '/reading');
                        },
                      ),
                      ReadingCard(
                        reading: '1400Hrs Reading',
                        status: 'PENDING',
                        fontW: FontWeight.w300,
                        onPressed: () {
                          Navigator.pushNamed(context, '/reading');
                        },
                      ),
                      ReadingCard(
                        reading: '2000Hrs Reading',
                        status: 'PENDING',
                        fontW: FontWeight.w300,
                        onPressed: () {
                          Navigator.pushNamed(context, '/reading');
                        },
                      ),
                    ],
                  ),
                )
                //   },
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
