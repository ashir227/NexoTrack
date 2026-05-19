import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nexotrack/Screnes/MainScr.dart';

class LoginPro extends ChangeNotifier {
  String pass = "";
  // String? password;
  islogin(BuildContext context, String pass) {
    if (pass == "122") {
      var box = Hive.box("login");
      Navigator.push(
        (context),
        MaterialPageRoute(builder: (context) => Mainnscr()),
      );
    }
  }
}
