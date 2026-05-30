import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nexotrack/Screnes/AddCoin.dart';

class FuncPro extends ChangeNotifier {
  addcoinpro(Addcoin) {
    var box = Hive.box("mycoin");
    box.add(Addcoin);
    notifyListeners();
  }

  TotalAmnt() {
    var box = Hive.box("Amount");
    // final total =
  }
}
