import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:substation_app/screens/reading_screen.dart';

class AuthResult {
  //Firebase.initializeApp();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference userRefs =
      FirebaseDatabase.instance.reference().child('users');

  Future signInAnnon() async {
    // final User user = (await auth.signInAnonymously()).user;
    //auth.authStateChanges().map(() => null);

    // try {
    //   UserCredential userCredential = await auth.signInAnonymously();
    //   User user = userCredential.user;
    //   return user;
    // } catch (e) {
    //   print(e.toString());
    //   return null;
    // }
  }

  registerUserWithEmail(
      BuildContext context, String _email, String _password) async {
    final User user = (await auth
            .createUserWithEmailAndPassword(email: _email, password: _password)
            .catchError((onError) {
      Fluttertoast.showToast(
          msg: "Error" + onError.toString(), toastLength: Toast.LENGTH_LONG);
    }))
        .user;
    if (user != null) //user is created
    {
      //Save to db
      userRefs.child(user.uid);
      //webUserRef.child(user.uid);

      Map userMapData = {
        'email': _email.trim(),
        'password': _password.trim(),
      };
      userRefs.child(user.uid).set(userMapData);
      // webUserRef.child(user.uid).set(userMapData);
      Fluttertoast.showToast(
          msg: "Congratulation Your ACcount has been Created");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => ReadingScreen(),
        ),
      );
    } else {
      Fluttertoast.showToast(
          msg: "Email Address Already exist try Login Screen",
          toastLength: Toast.LENGTH_LONG);
    }
  }

  loginWithEmail(String _email, String _password, BuildContext context) async {
    final User user = (await auth
            .signInWithEmailAndPassword(email: _email, password: _password)
            .catchError((errMsg) {
      Fluttertoast.showToast(
          msg: "ERROR" + errMsg.toString(), toastLength: Toast.LENGTH_LONG);
    }))
        .user;
    if (user != null) {
      userRefs.child(user.uid).once().then((value) => (DataSnapshot snapshot) {
            if (snapshot.value != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ReadingScreen(),
                ),
              );
              Fluttertoast.showToast(
                  msg: "Login Sucessfully!!", toastLength: Toast.LENGTH_LONG);
            } else {
              auth.signOut();
              Fluttertoast.showToast(
                  msg: "Error Login No record of your email",
                  toastLength: Toast.LENGTH_LONG);
            }
          });
    } else {
      Fluttertoast.showToast(
          msg: "Error Occured Can be SIgned in!!",
          toastLength: Toast.LENGTH_LONG);
    }
  }

  signInWithGoogle() async {
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        User user = userCredential.user;
        return user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignInAccount googleSignInAccount =
          await GoogleSignIn().signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);
          User user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            Fluttertoast.showToast(
                msg: 'The account already exists with a different credential',
                toastLength: Toast.LENGTH_LONG);
          } else if (e.code == 'invalid-credential') {
            Fluttertoast.showToast(
                msg: 'Error occurred while accessing credentials. Try again.',
                toastLength: Toast.LENGTH_LONG);
          }
        } catch (e) {
          Fluttertoast.showToast(
              msg: 'Error occurred using Google Sign in Try again.',
              toastLength: Toast.LENGTH_LONG);
        }
      }
    }

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Fluttertoast.showToast(msg: "'Error signing out. Try again.");
    }
  }
}
