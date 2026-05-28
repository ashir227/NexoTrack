import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class FuncPro extends ChangeNotifier {
  addPro() {
    var box = Hive.box("Amount");
    box.add("value");
  }
}
