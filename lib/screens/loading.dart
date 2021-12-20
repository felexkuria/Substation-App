import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:substation_app/models/user.dart';
import 'package:substation_app/screens/homescreen.dart';
import 'package:substation_app/screens/reading_screen.dart';
import 'package:substation_app/services/auth.dart';

import 'dashboard.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = 'loading';
  void loadLogin() async {}

  @override
  void initState() {
    super.initState();
    // print('object in Init State');
    // worldTime.getTime();
    // //loadLogin();
    // Navigator.pushNamed(context, '/dashboard');
    // setState(() {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (BuildContext context) => DashBoard(),
    //     ),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthResult>(context);
    return StreamBuilder<User>(
        stream: auth.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User user = snapshot.data;
            return user == null ? HomeScreen() : ReadingScreen();
          } else {
            return Scaffold(
              backgroundColor: Colors.indigo[100],
              body: SafeArea(
                child: Center(
                  child: SpinKitCircle(
                    color: Colors.black,
                    size: 100.0,
                  ),
                ),
              ),
            );
          }
        });
  }
}
