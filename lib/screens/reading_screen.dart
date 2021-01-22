import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:substation_app/widgets/custom_text_field.dart';
import 'package:substation_app/widgets/person_card.dart';
import 'package:substation_app/widgets/reading_card.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = true;
String _activepower;
String _reactivepower;
int activepower;
String _name;

// String _displayName;
bool _loading = false;

class ReadingScreen extends StatefulWidget {
  @override
  _ReadingScreenState createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF343150),
        appBar: AppBar(
          backgroundColor: Color(0xFF3A3756),
          title: Text('Readings'),
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
                    '1  of 7',
                    style: TextStyle(
                        color: Color(0xFFFBFCFF),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
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
                    Alert(
                        context: context,
                        title: "Calculate N1 Reading",
                        content: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                autovalidate: _autoValidate,
                                child: Column(
                                  children: <Widget>[
                                    CustomTextField(
                                      onSaved: (input) {
                                        _activepower = input;
                                      },
                                      // validator: emailValidator,
                                      icon: Icon(Icons.wb_incandescent),
                                      hint: "Active Power",
                                      onChanged: (validator) {
                                        setState(() {
                                          // ignore: unnecessary_statements
                                          _activepower * 1980;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        buttons: [
                          DialogButton(
                            color: Color(0xFF343150),
                            onPressed: () {
                              print(_activepower);
                            },
                            child: _loading == false
                                ? Text(
                                    "Calculate",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                : CircularProgressIndicator(
                                    backgroundColor: Colors.red,
                                  ),
                          ),
                        ]).show();
                  },
                ),
                ReadingCard(
                  reading: 'N2 Cabinet',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
                  onPressed: () {
                    Alert(
                        context: context,
                        title: "Calculate N2 Reading",
                        content: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                autovalidate: _autoValidate,
                                child: Column(
                                  children: <Widget>[
                                    CustomTextField(
                                      onSaved: (input) {
                                        _activepower = input;
                                      },
                                      // validator: emailValidator,
                                      icon: Icon(Icons.wb_incandescent),
                                      hint: "Active Power",
                                      onChanged: (validator) {
                                        setState(() => _activepower);
                                      },
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    CustomTextField(
                                      onSaved: (input) {
                                        _reactivepower = input;
                                      },
                                      // validator: emailValidator,
                                      icon: Icon(Icons.ac_unit),
                                      hint: "Reactive Power",
                                      onChanged: (validator) {
                                        setState(() => _reactivepower);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        buttons: [
                          DialogButton(
                            color: Color(0xFF343150),
                            onPressed: () {
                              print(_activepower);
                            },
                            child: _loading == false
                                ? Text(
                                    "Calculate",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                : CircularProgressIndicator(
                                    backgroundColor: Colors.red,
                                  ),
                          ),
                        ]).show();
                  },
                ),
                ReadingCard(
                  reading: 'N3 Cabinet',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
                  onPressed: () {
                    Alert(
                        context: context,
                        title: "Calculate N3 Reading",
                        content: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                autovalidate: _autoValidate,
                                child: Column(
                                  children: <Widget>[
                                    CustomTextField(
                                      onSaved: (input) {
                                        _activepower = input;
                                      },
                                      // validator: emailValidator,
                                      icon: Icon(Icons.wb_incandescent),
                                      hint: "Active Power",
                                      onChanged: (validator) {
                                        setState(() => _activepower);
                                      },
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    CustomTextField(
                                      onSaved: (input) {
                                        _reactivepower = input;
                                      },
                                      // validator: emailValidator,
                                      icon: Icon(Icons.ac_unit),
                                      hint: "Reactive Power",
                                      onChanged: (validator) {
                                        setState(() => _reactivepower);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        buttons: [
                          DialogButton(
                            color: Color(0xFF343150),
                            onPressed: () {
                              print(_activepower);
                            },
                            child: _loading == false
                                ? Text(
                                    "Calculate",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
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
                  onPressed: () {
                    Alert(
                        context: context,
                        title: "Calculate N6 Reading",
                        content: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                autovalidate: _autoValidate,
                                child: Column(
                                  children: <Widget>[
                                    CustomTextField(
                                      onSaved: (input) {
                                        _activepower = input;
                                      },
                                      // validator: emailValidator,
                                      icon: Icon(Icons.wb_incandescent),
                                      hint: "Active Power",
                                      onChanged: (validator) {
                                        setState(() => _activepower);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        buttons: [
                          DialogButton(
                            color: Color(0xFF343150),
                            onPressed: () {
                              print(_activepower);
                            },
                            child: _loading == false
                                ? Text(
                                    "Calculate",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                : CircularProgressIndicator(
                                    backgroundColor: Colors.red,
                                  ),
                          ),
                        ]).show();
                  },
                ),
                ReadingCard(
                  reading: 'N7 Cabinet',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
                  onPressed: () {
                    Alert(
                        context: context,
                        title: "Calculate N7 Reading",
                        content: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                autovalidate: _autoValidate,
                                child: Column(
                                  children: <Widget>[
                                    CustomTextField(
                                      onSaved: (input) {
                                        _activepower = input;
                                      },
                                      // validator: emailValidator,
                                      icon: Icon(Icons.wb_incandescent),
                                      hint: "Active Power",
                                      onChanged: (validator) {
                                        setState(() => _activepower);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        buttons: [
                          DialogButton(
                            color: Color(0xFF343150),
                            onPressed: () {
                              print(_activepower);
                            },
                            child: _loading == false
                                ? Text(
                                    "Calculate",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                : CircularProgressIndicator(
                                    backgroundColor: Colors.red,
                                  ),
                          ),
                        ]).show();
                  },
                ),
                ReadingCard(
                  reading: 'N9 Cabinet',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
                  onPressed: () {
                    Alert(
                        context: context,
                        title: "Calculate N9 Reading",
                        content: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                autovalidate: _autoValidate,
                                child: Column(
                                  children: <Widget>[
                                    CustomTextField(
                                      onSaved: (input) {
                                        _activepower = input;
                                      },
                                      // validator: emailValidator,
                                      icon: Icon(Icons.wb_incandescent),
                                      hint: "Active Power",
                                      onChanged: (validator) {
                                        setState(() => _activepower);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        buttons: [
                          DialogButton(
                            color: Color(0xFF343150),
                            onPressed: () {
                              print(_activepower);
                            },
                            child: _loading == false
                                ? Text(
                                    "Calculate",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                : CircularProgressIndicator(
                                    backgroundColor: Colors.red,
                                  ),
                          ),
                        ]).show();
                  },
                ),
                ReadingCard(
                  reading: 'N10 Cabinet',
                  status: 'PENDING',
                  fontW: FontWeight.w300,
                  onPressed: () {
                    Alert(
                        context: context,
                        title: "Calculate N10 Reading",
                        content: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                autovalidate: _autoValidate,
                                child: Column(
                                  children: <Widget>[
                                    CustomTextField(
                                      onSaved: (input) {
                                        _activepower = input;
                                      },
                                      // validator: emailValidator,
                                      icon: Icon(Icons.wb_incandescent),
                                      hint: "Active Power",
                                      onChanged: (validator) {
                                        setState(() => _activepower);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        buttons: [
                          DialogButton(
                            color: Color(0xFF343150),
                            onPressed: () {
                              print(_activepower);
                            },
                            child: _loading == false
                                ? Text(
                                    "Calculate",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                : CircularProgressIndicator(
                                    backgroundColor: Colors.red,
                                  ),
                          ),
                        ]).show();
                  },
                ),
              ],
            );
          },
        ));
  }
}
