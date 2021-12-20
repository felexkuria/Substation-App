import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:substation_app/models/user.dart';
import 'package:substation_app/screens/loading.dart';
import 'screens/homescreen.dart';

const inActiveCardColor = Color(0xFFF9FAFC);
const activeCardColor = Color(0xFF3A3756);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [Provider<LocalUser>(create: (_) => LocalUser())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Loading(),
      ),
    ),
  );
}

// class MainScreen extends StatelessWidget {
//   // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting)
//           return Loading();
//         if (!snapshot.hasData || snapshot.hasData == null) return HomeScreen();
//         return HomeScreen();
//       },
//     );
//   }
// }
