import 'package:flutter/material.dart';
import 'package:substation_app/screens/homescreen.dart';
import 'package:substation_app/models/sign_in.dart';

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
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Today',
                                  style: TextStyle(
                                      fontFamily: 'Pacifico',
                                      fontSize: 20.0,
                                      letterSpacing: 1.2,
                                      color: Color(0xFF3B1F83)),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Month',
                                  style: TextStyle(
                                      fontFamily: 'Pacifico',
                                      fontSize: 20.0,
                                      letterSpacing: 1.2,
                                      color: Color(0xFFFAFAFA)),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF3B1F83),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Quarter',
                                  style: TextStyle(
                                      fontFamily: 'Pacifico',
                                      fontSize: 20.0,
                                      letterSpacing: 1.2,
                                      color: Color(0xFFFFFFFF)),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF3B1F83),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 60.0,
                        foregroundColor: Color(0xFFFFFFFF),
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                      Text(
                        'Felex Kuria',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: Color(0xFFFFFFFF)),
                      ),
                      Text(
                        'OnShift',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 20.0,
                            letterSpacing: 1.2,
                            color: Color(0xFFFFFFFF)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 35.0,
                        foregroundColor: Color(0xFFFFFFFF),
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                      Text(
                        'Felex Kuria',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: Color(0xFFFFFFFF)),
                      ),
                      Text(
                        'Rest',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 20.0,
                            letterSpacing: 1.2,
                            color: Color(0xFFFFFFFF)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 35.0,
                        foregroundColor: Color(0xFFFFFFFF),
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                      Text(
                        'Felex Kuria',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: Color(0xFFFFFFFF)),
                      ),
                      Text(
                        'Rest',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 20.0,
                            letterSpacing: 1.2,
                            color: Color(0xFFFFFFFF)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
