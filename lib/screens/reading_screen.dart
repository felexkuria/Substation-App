import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:substation_app/constants/constant.dart';
import 'package:substation_app/models/readings.dart';
import 'package:substation_app/screens/worker.dart';
import 'package:substation_app/widgets/reading_card.dart';

import 'package:substation_app/constants/constant.dart';
import 'package:substation_app/models/readings.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = true;
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

//double myNumber = double.parse(_activepower);
// String _reactivepower = '';
//double myNumber2 = double.parse(_reactivepower);
//int activepower;
String processing;

// String _displayName;
bool _loading = false;
TimeOfDay _timeOfDay = TimeOfDay.now();

class ReadingScreen extends StatefulWidget {
  @override
  _ReadingScreenState createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  Readings readings = Readings();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _activepowerController = TextEditingController();
  TextEditingController _reactivepowerController = TextEditingController();

  TextEditingController _activepowerController1 = TextEditingController();
  TextEditingController _reactivepowerController1 = TextEditingController();
  TextEditingController _activepowerController2 = TextEditingController();
  TextEditingController _reactivepowerController2 = TextEditingController();
  String selectedPowerValue = "More";

  TimeOfDayFormat timeOfDayFormat = TimeOfDayFormat.HH_colon_mm;

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

  @override
  void initState() {
    super.initState();
    _timeController = TextEditingController();
  }

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF232228),
        appBar: AppBar(
          backgroundColor: Color(0xFF0C0B10),
          title: Text('Readings'),
          actions: [
            // FaIcon(FontAwesomeIcons.bars,),

            IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Today Readings',
                    style: TextStyle(
                        color: Color(0xFFFBFCFF),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _timeOfDay.format(context),
                    style: kLabelTextStyle,
                  )
                ],
              );
            }
            return Column(
              children: [
                ReadingCard(
                  reading: 'N1 Cabinet',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
                  onPressed: () {},
                ),
                ReadingCard(
                  reading: 'N2 Cabinet',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
                  onPressed: () {},
                ),
                ReadingCard(
                  reading: 'N3 Cabinet',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
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
                              //Navigator.popAndPushNamed(context, '/reading');`
                              //print(_activepower
                              //print(_reactivepower);
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
                            },
                            child: _loading == false
                                ? Text(
                                    "Calculate",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )
                                : CircularProgressIndicator(
                                    backgroundColor: Colors.red,
                                  ),
                          ),
                        ]).show();
                  },
                ),
                ReadingCard(
                  reading: 'N6 Cabinet',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
                  onPressed: () {},
                ),
                ReadingCard(
                  reading: 'N7 Cabinet',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
                  onPressed: () {},
                ),
                ReadingCard(
                  reading: 'N9 Cabinet',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
                  onPressed: () {},
                ),
                ReadingCard(
                  reading: 'N10 Cabinet',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
                  onPressed: () {},
                ),
              ],
            );
          },
        ));
  }

  Alert buildAlert2(BuildContext context) {
    return Alert(
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
                controller: _activepowerController1,
                decoration: kInputdecoration1,
                keyboardType: TextInputType.number,
                onChanged: (validator) {
                  setState(() {
                    _activepower1980 = validator;

                    print(_activepower1980);
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 150.0,
                color: Theme.of(context).primaryColor,
                child: DropdownButton(
                  value: selectedPowerValue,
                  items: [
                    DropdownMenuItem(
                      child: Text("Settings"),
                      value: "Settings",
                    ),
                    DropdownMenuItem(
                      child: Text("Contact Us"),
                      value: "Settings",
                    ),
                    DropdownMenuItem(
                      child: Text("Upload"),
                      value: "Settings",
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedPowerValue = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _reactivepowerController2,
                decoration: kInputdecoration,
                keyboardType: TextInputType.number,
                onChanged: (validator) {
                  setState(() {
                    _reactivepower1980 = validator;

                    print(_reactivepower1980);
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
              //Navigator.popAndPushNamed(context, '/reading');`
              //print(_activepower
              //print(_reactivepower);
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
              readings.getReactivePower(
                reactivePower1: double.parse(_activepower1980),
                reactivePower: double.parse(_reactivepower1980),
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
        ]);
  }

  Alert buildAlert(
    BuildContext context,
  ) {
    return Alert(
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
                controller: _activepowerController,
                decoration: kInputdecoration1,
                keyboardType: TextInputType.number,
                onChanged: (validator) {
                  setState(() {
                    _activepower = validator;

                    print(_activepower);
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _reactivepowerController,
                decoration: kInputdecoration,
                keyboardType: TextInputType.number,
                onChanged: (validator) {
                  setState(() {
                    _reactivepower = validator;

                    print(_reactivepower);
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
              //Navigator.popAndPushNamed(context, '/reading');`
              //print(_activepower
              //print(_reactivepower);
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
              readings.getActivePower(
                activePower1: double.parse(_activepower),
                activePower: double.parse(_reactivepower),
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
        ]);
  }
}
