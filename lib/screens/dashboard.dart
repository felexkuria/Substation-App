import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:substation_app/constants/constant.dart';
import 'package:substation_app/models/readings.dart';
import 'package:substation_app/models/user.dart';
import 'package:substation_app/screens/homescreen.dart';
import 'package:substation_app/screens/worker.dart';
import 'package:substation_app/services/auth.dart';
import 'package:substation_app/widgets/person_card.dart';

import 'package:substation_app/widgets/reading_card.dart';
import 'package:substation_app/widgets/select_card.dart';
import 'package:table_calendar/table_calendar.dart';

enum Time { month, today, quarter }

const inActiveCardColor = Color(0xFF20BFA9);
const activeCardColor = Color(0xFF070707);
String result;
// const selectorCardColor =Color(0xFF343150);  Color(0xFF343150)
String _activepower660 = '';
//double myNumber = double.parse(_activepower);
String _reactivepower660 = '';
String _activepower1980 = '';
String _reactivepower1980 = '';
String _activepower = '';
String _reactivepower = '';
//double myNumber2 = double.parse(_reactivepower);
//int activepower;
//String processing;

//double activePowerCode = 660;

// String _displayName;
bool _loading = false;
TimeOfDay _timeOfDay = TimeOfDay.now();
AuthResult authResult = AuthResult();

class DashBoard extends StatefulWidget {
  DashBoard({this.username});
  final String username;
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Readings readings = Readings();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _activepowerController = TextEditingController();
  TextEditingController _reactivepowerController = TextEditingController();
  TextEditingController _activepowerController1 = TextEditingController();
  TextEditingController _reactivepowerController1 = TextEditingController();
  TextEditingController _activepowerController2 = TextEditingController();
  TextEditingController _reactivepowerController2 = TextEditingController();
  void _handleTime() async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (timeOfDay != null && timeOfDay != _timeOfDay) {
      setState(() {
        _timeOfDay = timeOfDay;
      });
      _timeController.text = _timeOfDay.format(context);
    }
  }

  Time selectedTime;
  DateTime _date = DateTime.now();

  final DateFormat _dateFormatter = DateFormat.yMMMMEEEEd().add_jms();
  void _handleDatetime() async {
    final DateTime dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2135),
    );
    if (dateTime != null && dateTime != _date) {
      setState(() {
        _date = dateTime;
      });
    }
  }

  CalendarController calendarController;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    calendarController = CalendarController();
    _events = {};
    _selectedEvents = [];
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
        decodeMap(
          jsonDecode(
            prefs.getString("events") ?? "{}",
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    calendarController = CalendarController();
    _timeController = TextEditingController();
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach(
      (key, value) {
        newMap[key.toString()] = map[key];
      },
    );
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  //AuthResult authResult = AuthResult();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF232228),
        appBar: AppBar(
          leading: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.bars,
              color: Color(0xFFFBFCFF),
              size: 20.0,
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
                AuthResult().logOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen(),
                  ),
                );

                //Navigator.pushNamed(context, 'worker');
              },
              icon: FaIcon(
                FontAwesomeIcons.userCircle,
                color: Color(0xFFFBFCFF),
                size: 30.0,
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(16.0),
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.cog),
            )
          ],
          backgroundColor: Color(0xFF0C0B10),
          elevation: 5.0,
          title: Text(
            'Substation App',
            //style,R
            style: TextStyle(
              color: Color(0xFFFBFCFF),
              fontFamily: 'Quicksand',
              fontSize: 20.0,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12.0, 0, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PersonCard(
                        onPressed: () {
                          Navigator.pushNamed(context, 'worker');
                        },
                        radii: 60.0,
                        font: 18.0,
                        name: 'wamamaR',
                        shift: 'OnShift',
                        profile: AssetImage('assets/images/wycliffe.jpg'),
                        taf: 'wanyama',
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      PersonCard(
                        onPressed: () {},
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
                                color: Color(0xFF20BFA9),
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
                                    // Adding Table Calendar
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
                                  color: Color(0xFFFFFFFF),
                                  letterSpacing: 1.0,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TableCalendar(
                              events: _events,
                              onDaySelected: (DateTime date, events, holidays) {
                                //print(date);
                                // _selectedEvents=
                                setState(() {
                                  _selectedEvents = events;
                                });
                              },
                              startingDayOfWeek: StartingDayOfWeek.monday,
                              calendarController: calendarController,
                              daysOfWeekStyle: DaysOfWeekStyle(
                                weekendStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                weekdayStyle: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              headerStyle: HeaderStyle(
                                formatButtonTextStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                ),
                                leftChevronIcon: Icon(
                                  Icons.arrow_back_ios,
                                  color: inActiveCardColor,
                                ),
                                rightChevronIcon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: inActiveCardColor,
                                ),
                                formatButtonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: inActiveCardColor,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 10.0,
                                          offset: Offset(0, 6))
                                    ]),
                                titleTextStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Quicksand'),
                                centerHeaderTitle: true,
                              ),
                              calendarStyle: CalendarStyle(
                                markersColor: inActiveCardColor,
                                holidayStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                weekendStyle: TextStyle(
                                  //weekend content
                                  color: inActiveCardColor,
                                ),
                                selectedColor: activeCardColor,
                                weekdayStyle:
                                    //days inside calendar
                                    TextStyle(color: inActiveCardColor),
                                outsideWeekendStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                outsideStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                todayColor: inActiveCardColor,
                                todayStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: activeCardColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ..._selectedEvents.map(
                              (events) => Container(
                                // padding: EdgeInsets.all(12.0),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10.0),
                                // height: 110.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[900],
                                      blurRadius: 6.0,
                                      offset: Offset(0, 6),
                                    ),
                                  ],
                                ),

                                child: ListTile(
                                  leading: Text(
                                    'Panel N 1 Results',
                                    style: TextStyle(
                                        color: inActiveCardColor,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Quicksand'),
                                  ),
                                  tileColor: activeCardColor,
                                  subtitle: Text(
                                    'data',
                                    style: TextStyle(color: inActiveCardColor),
                                  ),
                                  title: Text(
                                    events,
                                    style: TextStyle(color: inActiveCardColor),
                                  ),
                                ),
                              ),
                            ),
                            ReadingCard(
                              reading: '0800Hrs Reading',
                              status: 'PENDING',
                              fontW: FontWeight.w300,
                              onPressed: () {
                                //Navigator.pushNamed(context, '/reading');
                              },
                            ),
                            ReadingCard(
                              reading: '1400Hrs Reading',
                              status: 'PENDING',
                              fontW: FontWeight.w300,
                              onPressed: () {
                                //Navigator.pushNamed(context, '/reading');
                              },
                            ),
                            ReadingCard(
                              reading: '2000Hrs Reading',
                              status: 'PENDING',
                              fontW: FontWeight.w300,
                              onPressed: () {
                                // Navigator.pushNamed(context, '/reading');
                              },
                            ),
                          ],
                        ),
                      )
                      //   },
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: FaIcon(
            FontAwesomeIcons.plus,
            color: activeCardColor,
            size: 20,
          ),
          backgroundColor: inActiveCardColor,
          onPressed: () {
            Alert(
                context: context,
                title: "Calculate Today Reading",
                content: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        readOnly: true,
                        controller: _timeController,
                        onTap: _handleTime,
                        decoration: kTimedecoration,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        controller: _activepowerController2,
                        decoration: kInputdecoration1,
                        keyboardType: TextInputType.number,
                        onChanged: (validator) {
                          setState(() {
                            _activepower660 = validator;

                            print(_activepower660);
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        controller: _reactivepowerController1,
                        decoration: kInputdecoration,
                        keyboardType: TextInputType.number,
                        onChanged: (validator) {
                          setState(() {
                            _reactivepower660 = validator;

                            print(_reactivepower660);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                buttons: [
                  DialogButton(
                    color: Color(0xFF20BFA9),
                    onPressed: () {
                      setState(
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Worker(
                                result660: readings.result2.toString(),
                                result1980: readings.result3.toString(),
                                result: readings.result.toString(),
                                date: _timeController.text,
                              ),
                            ),
                          );
                          readings.getPowerConsumed(
                            activePower1: double.parse(_activepower660),
                            activePower: double.parse(_reactivepower660),
                          );
                          if (readings.result3.toStringAsFixed(2).isEmpty)
                            return;

                          if (_events[calendarController.selectedDay] != null) {
                            _events[calendarController.selectedDay]
                                .add(readings.result3.toStringAsFixed(2));
                          } else {
                            _events[calendarController.selectedDay] = [
                              readings.result3.toStringAsFixed(2)
                            ];
                          }
                          prefs.setString(
                            "events",
                            jsonEncode(
                              encodeMap(_events),
                            ),
                          );
                          //readings.result3.toStringAsFixed(2).clea
                        },
                      );
                    },
                    child: _loading == false
                        ? Text(
                            "Calculate",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )
                        : CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                  ),
                ]).show();
          },
        ),
      ),
    );
  }
}
