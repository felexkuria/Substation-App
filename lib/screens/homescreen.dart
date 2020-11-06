import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:substation_app/models/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:substation_app/screens/dashboard.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
bool _success;
String _userEmail;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              child: SafeArea(
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
                                title: "LOGIN",
                                content: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      TextFormField(
                                        controller: _emailController,
                                        decoration: const InputDecoration(
                                            labelText: 'Email'),
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                      ),
                                      TextFormField(
                                        controller: _passwordController,
                                        decoration: const InputDecoration(
                                            labelText: 'Password'),
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                buttons: [
                                  DialogButton(
                                    color: Colors.redAccent,
                                    onPressed: () async {
                                      // if (_formKey.currentState.validate()) {
                                      //   _register();
                                      // }
                                    },
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
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
                          onPressed: () {},
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
                            signInWithGoogle().whenComplete(() {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DashBoard();
                                  },
                                ),
                              );
                            });
                          },
                          child: Row(
                            children: [
                              Image(
                                  image: AssetImage(
                                      "assets/images/google_logo.png"),
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
                    Text(
                      'Already a Member? Login',
                      style: TextStyle(
                          fontSize: 18.0,
                          letterSpacing: 0.25,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
