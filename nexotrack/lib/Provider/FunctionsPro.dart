import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nexotrack/Models/portfolio_model.dart';

class FuncPro extends ChangeNotifier {
  List<PortfolioModel> MyCoin = [];
  addcoinpro(PortfolioModel Addcoin) {
    var box = Hive.box("mycoin");
    box.add(Addcoin);
    MyCoin = box.values.cast<PortfolioModel>().toList();
    notifyListeners();
    return null;
  }
}
