import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:substation_app/widgets/custom_text_field.dart';
import 'package:substation_app/widgets/person_card.dart';
import 'package:substation_app/widgets/reading_card.dart';
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = true;
String _activepower;
String _password;
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: PersonCard(
              radii: 60.0,
              font: 20.0,
              name: 'Felex Kuria',
              profile: AssetImage('assets/images/profile.jpg'),
              shift: 'Rest',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ReadingCard(
                      reading: 'N1 Cabinet',
                      status: 'PENDING',
                      fontW: FontWeight.w300,
                      onPressed: () {
                        Navigator.pushNamed(context, '/reading');
                      },
                    ),
                    ReadingCard(
                      reading: 'N2 Cabinet',
                      status: 'PENDING',
                      fontW: FontWeight.w300,
                      onPressed: () {
                        Navigator.pushNamed(context, '/reading');
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  ReadingCard(
                    reading: 'N3 Cabinet',
                    status: 'PENDING',
                    fontW: FontWeight.w300,
                    onPressed: () {
                      Navigator.pushNamed(context, '/reading');
                    },
                  ),
                  ReadingCard(
                    reading: 'N6 Cabinet',
                    status: 'PENDING',
                    fontW: FontWeight.w300,
                    onPressed: () {
                      Navigator.pushNamed(context, '/reading');
                    },
                  )
                ],
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  ReadingCard(
                    reading: 'N7 Cabinet',
                    status: 'PENDING',
                    fontW: FontWeight.w300,
                    onPressed: () {
                      Navigator.pushNamed(context, '/reading');
                    },
                  ),
                  ReadingCard(
                    reading: 'N9 Cabinet',
                    status: 'PENDING',
                    fontW: FontWeight.w300,
                    onPressed: () {
                      Navigator.pushNamed(context, '/reading');
                    },
                  )
                ],
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  ReadingCard(
                    reading: 'N10 Cabinet',
                    status: 'PENDING',
                    fontW: FontWeight.w300,
                    onPressed: () {
                      Alert(
                          context: context,
                          title: "Calculate 10 Reading",


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
                                    onChanged:(validator) {
                                      setState(()
                                      =>_activepower

                                      );

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
                              color:Color(0xFF343150),
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
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
