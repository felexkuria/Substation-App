import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

String _email;
String _password;

void userSignUp() async {
  var url = "https://multi-touchenterprisekenya.co.ke/backEnd/signup.php";
  var data = {
    "email": _email,
    // "name":_name,
    "pass": _password,
  };
  var res = await http.post(url, body: data);
  if (jsonDecode(res.body) == "dont have an account") {
    Fluttertoast.showToast(
        msg: "dont have an account, Create an Account",
        toastLength: Toast.LENGTH_SHORT);
  } else {
    if (jsonDecode(res.body) == "false") {
      Fluttertoast.showToast(
          msg: "incorrect password", toastLength: Toast.LENGTH_SHORT);
    } else {
      print(jsonDecode(res.body));
    }
  }
}
