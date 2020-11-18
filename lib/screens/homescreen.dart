import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'file:///C:/Users/User/Documents/Project%20Genesis/Android%20Projects/Flutter/substation_app/lib/services/sign_in.dart';
import 'package:substation_app/screens/dashboard.dart';
import 'package:substation_app/widgets/custom_text_field.dart';
import 'package:http/http.dart' as http;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = true;
String _email;
String _password;
String _name;

// String _displayName;
bool _loading = false;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // void userSignIn() async {
  //   setState(() {
  //     _loading = true;
  //   });
  //   var url = "https://multi-touchenterprisekenya.co.ke/backEnd/signin.php";
  //   var data = {
  //     "email": _email,
  //     "pass": _password,
  //   };
  //   var res = await http.post(url, body: data);
  //   if (jsonDecode(res.body) == "dont have an account") {
  //     Fluttertoast.showToast(
  //         msg: "dont have an account, Create an Account",
  //         toastLength: Toast.LENGTH_SHORT);
  //   } else {
  //     if (jsonDecode(res.body) == "false") {
  //       Fluttertoast.showToast(
  //           msg: "incorrect password", toastLength: Toast.LENGTH_SHORT);
  //     } else {
  //       print(jsonDecode(res.body));
  //     }
  //   }
  // }

  void userSignUp() async {
    setState(() {
      _loading = true;
    });

    var url = "https://multi-touchenterprisekenya.co.ke/backEnd/signup.php";
    var data = {
      "email": _email,
      "name": _name,
      "pass": _password,
    };
    var res = await http.post(url, body: data);
    if (jsonDecode(res.body) == "dont have an account") {
      Fluttertoast.showToast(
          msg: "don't have an account, Create an Account",
          toastLength: Toast.LENGTH_SHORT);
    } else {
      if (jsonDecode(res.body) == "false") {
        Fluttertoast.showToast(
            msg: "incorrect password", toastLength: Toast.LENGTH_SHORT);
      } else {
        print(jsonDecode(res.body));
      }
    }
    setState(() {
      _loading=false;
    });
  }

  // get http => null;

  // AuthResult _authResult =AuthResult();

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
                                    Form(
                                      key: _formKey,
                                      // ignore: deprecated_member_use
                                      autovalidate: _autoValidate,
                                      child: Column(
                                        children: <Widget>[
                                          CustomTextField(
                                            onSaved: (input) {
                                              _email = input;
                                            },
                                            // validator: emailValidator,
                                            icon: Icon(Icons.email),
                                            hint: "EMAIL",
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          CustomTextField(
                                            icon: Icon(Icons.lock),
                                            // obsecure: true,
                                            onSaved: (input) =>
                                            _name = input,
                                            validator: (input) => input.isEmpty
                                                ? "*Required"
                                                : null,
                                            hint: "USERNAME",
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          CustomTextField(
                                            icon: Icon(Icons.lock),
                                            obsecure: true,
                                            onSaved: (input) =>
                                                _password = input,
                                            validator: (input) => input.isEmpty
                                                ? "*Required"
                                                : null,
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
                                    userSignUp();
                                    // userSignIn();
                                    print(_name);
                                    print(_password);
                                    print(_email);
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
                                )
                              ]).show();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.email_sharp,
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
                              title: "Register",
                              content: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Form(
                                      key: _formKey,
                                      // ignore: deprecated_member_use
                                      autovalidate: _autoValidate,
                                      child: Column(
                                        children: <Widget>[
                                          CustomTextField(
                                            onSaved: (input) {
                                              _email = input;
                                            },
                                            // validator: emailValidator,
                                            icon: Icon(Icons.email),
                                            hint: "EMAIL",
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          CustomTextField(
                                            icon: Icon(Icons.lock),
                                            obsecure: true,
                                            onSaved: (input) => _name = input,
                                            validator: (input) =>
                                            input.isEmpty ? "*Required" : null,
                                            hint: "USERNAME",
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          CustomTextField(
                                            icon: Icon(Icons.account_box_rounded),
                                            // obsecure: true,
                                            onSaved: (input) => _email = input,
                                            validator: (input) =>
                                            input.isEmpty ? "*Required" : null,
                                            hint: "EMAIL",
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
                                    userSignUp();
                                  },
                                  child: _loading == false
                                      ? Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                      : CircularProgressIndicator(
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ]);

                        },
                        child: Row(
                          children: [
                            Image(
                                image: AssetImage(
                                    "assets/images/facebook_logo.jpg"),
                                height: 35.0),
                            // Icon(
                            //   Icons.fact_check,
                            //   color: Colors.white,
                            // ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              'Continue With Facebook',
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
                          signInWithGoogle()
                              .whenComplete(() {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  // return null;
                                  return DashBoard();
                                },
                              ),
                            );
                          });
                        },
                        child: Row(
                          children: [
                            Image(
                                image:
                                    AssetImage("assets/images/google_logo.png"),
                                height: 35.0),
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
                                  autovalidate: _autoValidate,
                                  child: Column(
                                    children: <Widget>[
                                      CustomTextField(


                                        onSaved: (input) {
                                          _email = input;
                                        },
                                        // validator: emailValidator,
                                        icon: Icon(Icons.email),
                                        hint: "EMAIL",
                                        onChanged:(validator) {
                                          setState(()
                                              =>_email=validator

                                          );

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
                                userSignUp();
                                print(_email);
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
                          fontSize:20.0,
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
