import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

String _email;
String _password;
void userSignIn() async {
  var url = "https://multi-touchenterprisekenya.co.ke/backEnd/signin.php";
  var data = {
    "email": _email,
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
