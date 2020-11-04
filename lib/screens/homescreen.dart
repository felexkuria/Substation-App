import 'package:flutter/material.dart';

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
                          onPressed: () {},
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
                              Icon(
                                Icons.fact_check,
                                color: Colors.white,
                              ),
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
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_to_drive,
                                color: Colors.black,
                              ),
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
