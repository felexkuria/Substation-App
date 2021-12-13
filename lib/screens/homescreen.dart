import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:substation_app/constants/constant.dart';
import 'package:substation_app/screens/dashboard.dart';
import 'package:substation_app/services/auth.dart';
import 'package:substation_app/services/sign_in.dart';
import 'package:substation_app/widgets/custom_text_field.dart';

import 'reading_screen.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String _email;
String _password;
String _name;
const inActiveCardColor = Color(0xFF20BFA9);
const activeCardColor = Color(0xFF070707);

// String _displayName;
bool _loading = false;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User user;

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/background.png"),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
              constraints: BoxConstraints.expand(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'WELCOME TO SUBSTATION .',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Quicksand',
                          // letterSpacing: 1.2,
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.all(16.0),
                        color: Colors.red[900],
                        onPressed: () {
                          Alert(
                              context: context,
                              title: "Register With Email",
                              content: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        TextFormField(
                                          controller: _emailTextController,
                                          decoration: kInputdecorationemail,
                                          validator: (val) => _emailTextController
                                                      .text.length <
                                                  6
                                              ? "Weak password Input A strong password with 6 character"
                                              : null,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onChanged: (validator) {
                                            setState(() {
                                              _email = validator;

                                              //print(_email);
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        TextFormField(
                                          controller: _passwordTextController,
                                          obscureText: true,
                                          decoration: kInputdecorationpassword,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          onChanged: (validator) {
                                            setState(() {
                                              _password = validator;

                                              //print(_password);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              buttons: [
                                DialogButton(
                                    color: inActiveCardColor,
                                    onPressed: () {
                                      if (_emailTextController.text.isEmpty ||
                                          _passwordTextController.text.isEmpty &
                                              !_emailTextController.text
                                                  .contains("@")) {
                                        Fluttertoast.showToast(
                                            msg: "Dont leave blank Field");
                                        return;
                                      } else {
                                        AuthResult().registerUserWithEmail(
                                          context,
                                          _emailTextController.text,
                                          _passwordTextController.text,
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                        color: activeCardColor,
                                        fontSize: 20,
                                      ),
                                    ))
                              ]).show();
                        },
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.envelope,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              'Continue With Email',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.all(16.0),
                        color: Colors.blue[900],
                        onPressed: () {
                          Alert(
                              context: context,
                              title: "Login With Email",
                              content: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    TextField(
                                      controller: _emailTextController,
                                      decoration: kInputdecorationemail,
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (validator) {
                                        setState(() {
                                          _email = validator;

                                          print(_email);
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    TextField(
                                      controller: _passwordTextController,
                                      obscureText: true,
                                      decoration: kInputdecorationpassword,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      onChanged: (validator) {
                                        setState(() {
                                          _password = validator;

                                          print(_password);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buttons: [
                                DialogButton(
                                  color: Colors.redAccent,
                                  onPressed: () {
                                    if (_emailTextController.text.isEmpty ||
                                        _passwordTextController.text.isEmpty) {
                                      print('REQUIRED are Empty ');
                                      return;
                                    } else {
                                      AuthResult().loginWithEmail(
                                          _emailTextController.text,
                                          _passwordTextController.text,
                                          context);
                                    }
                                  },
                                  child: _loading == false
                                      ? Text(
                                          "Submit",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )
                                      : CircularProgressIndicator(
                                          backgroundColor: Colors.red,
                                        ),
                                ),
                              ]).show();
                        },
                        child: Row(
                          children: [
                            Image(
                                image: AssetImage(
                                    "assets/images/facebook_logo.jpg"),
                                height: 25.0),
                            // Icon(
                            //   Icons.fact_check,
                            //   color: Colors.white,
                            // ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              'Already a Member?',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.all(16.0),
                        color: Colors.white,
                        onPressed: () {
                          AuthResult()
                              .signInWithGoogle()
                              .whenComplete(() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ReadingScreen(),
                                  )));
                        },
                        child: Row(
                          children: [
                            Image(
                                image:
                                    AssetImage("assets/images/google_logo.png"),
                                height: 25.0),
                            // Icon(
                            //   Icons.add_to_drive,
                            //   color: Colors.black,
                            // ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              'Continue With Google',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Alert(
                          context: context,
                          title: "Login With Email",
                          content: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Form(
                                  key: _formKey,
                                  // ignore: deprecated_member_use

                                  child: Column(
                                    children: <Widget>[
                                      CustomTextField(
                                        onSaved: (input) {
                                          _email = input;
                                        },
                                        // validator: emailValidator,
                                        icon: Icon(Icons.email),
                                        hint: "EMAIL",
                                        onChanged: (validator) {
                                          setState(() => _email = validator);
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      CustomTextField(
                                        icon: Icon(Icons.lock),
                                        obsecure: true,
                                        onSaved: (input) => _password = input,
                                        validator: (input) =>
                                            input.isEmpty ? "*Required" : null,
                                        hint: "PASSWORD",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          buttons: [
                            DialogButton(
                              color: Colors.redAccent,
                              onPressed: () {
                                AuthResult()
                                    .loginWithEmail(_email, _password, context);
                              },
                              child: _loading == false
                                  ? Text(
                                      "LOGIN",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )
                                  : CircularProgressIndicator(
                                      backgroundColor: Colors.red,
                                    ),
                            ),
                          ]).show();
                    },
                    child: Text(
                      'Already a Member? Login',
                      style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 0.25,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
