import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black87,
              size: 30.0,
            ),
            onPressed: () {},
          ),
          actions: [
            // IconButton(onPressed: () {  }, icon:Icon(
            //     Icons.account_circle,
            //   color: Colors.black87,
            //   size: 30.0,
            // ),

            // ),
            IconButton(
              padding: EdgeInsets.all(16.0),
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.black87,
                size: 30.0,
              ),
            )
          ],
          backgroundColor: Colors.amber,
          title: Center(
            child: Text(
              'Substation APP',
              style: TextStyle(
                color: Colors.black87,
                fontFamily: 'Pacifico',
                fontSize: 20.0,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
