import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nexotrack/Screnes/MainScr.dart';

class LoginPro extends ChangeNotifier {
  String pass = "";
  // String? password;
  islogin(var mail, String pass) {
    if (pass == "1234") {
      var box = Hive.box("login");
      box.put("islogin", true);
      notifyListeners();
      return true;
    }
    return false;
  }
}
