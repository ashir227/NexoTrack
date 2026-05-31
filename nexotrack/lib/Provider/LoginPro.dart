import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nexotrack/Screnes/MainScr.dart';

class LoginPro extends ChangeNotifier {
  String pass = "";
  // String? password;
  islogin(BuildContext context, int pass,var mail) {
    if (pass == "1234") {
      var box = Hive.box("login");
      box.put("islogin", true);
    
  }
}
