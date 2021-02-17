import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:substation_app/constants/constant.dart';
import 'package:substation_app/models/readings.dart';
<<<<<<< HEAD
import 'package:substation_app/screens/worker.dart';
import 'package:substation_app/widgets/reading_card.dart';
=======
>>>>>>> ea071398d12cde0dae3a98f32ad405996c0ef4e7

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = true;
String _activepower660 = '';
//double myNumber = double.parse(_activepower);
String _reactivepower660 = '';
String _activepower1980 = '';
String _reactivepower1980 = '';
String _activepower = '';
<<<<<<< HEAD
String _reactivepower = '';
//double myNumber2 = double.parse(_reactivepower);
//int activepower;
//String processing;

//double activePowerCode = 660;
=======
//double myNumber = double.parse(_activepower);
String _reactivepower = '';
//double myNumber2 = double.parse(_reactivepower);
//int activepower;
String processing;
>>>>>>> ea071398d12cde0dae3a98f32ad405996c0ef4e7

//double activePowerCode = 660;

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
<<<<<<< HEAD
  TextEditingController _activepowerController1 = TextEditingController();
  TextEditingController _reactivepowerController1 = TextEditingController();
  TextEditingController _activepowerController2 = TextEditingController();
  TextEditingController _reactivepowerController2 = TextEditingController();

  TimeOfDayFormat timeOfDayFormat = TimeOfDayFormat.HH_colon_mm;
=======
>>>>>>> ea071398d12cde0dae3a98f32ad405996c0ef4e7
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
  //   @override
  // void initState() {
  //   super.initState();
  //   if (widget.task != null) {
  //     _title = widget.task.title;
  //     _priority = widget.task.priority;
  //     _date = widget.task.date;
  //   }
  //   _timeController.text = _timeOfDay.format(context);
  // }

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
                onPressed: null)
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
                  onPressed: () {
                    buildAlert2(context).show();
                  },
                ),
                ReadingCard(
                  reading: 'N2 Cabinet',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
                  onPressed: () {
                    buildAlert(context).show();
                  },
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
<<<<<<< HEAD
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
=======
              Column(
                children: <Widget>[
                  TextField(
                      readOnly: true,
                      controller: _timeController,
                      onTap: _handleTime,
                      decoration: kTimedecoration),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: _activepowerController,
                    decoration: kInputdecoration,
                    keyboardType: TextInputType.number,
                    onChanged: (validator) {
                      setState(() {
                        _activepower = validator;

                        processing = _activepower;
                        //print(_activepower);
                      });
                    },
>>>>>>> ea071398d12cde0dae3a98f32ad405996c0ef4e7
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
<<<<<<< HEAD
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
=======
                  TextField(
                    decoration: kReactivedecoration,
                    controller: _reactivepowerController,
                    // validator: emailValidator,

                    onChanged: (validator) {
                      setState(() {
                        _reactivepower = validator;
                        //print(_reactivepower);
                      });
                    },
                  ),
                ],
>>>>>>> ea071398d12cde0dae3a98f32ad405996c0ef4e7
              ),
            ],
          ),
        ),
        buttons: [
          DialogButton(
            color: Color(0xFF20BFA9),
            onPressed: () {
<<<<<<< HEAD
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
=======
              //Navigator.popAndPushNamed(context, '/reading');
              print(_activepower);
              print(_reactivepower);
>>>>>>> ea071398d12cde0dae3a98f32ad405996c0ef4e7
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
