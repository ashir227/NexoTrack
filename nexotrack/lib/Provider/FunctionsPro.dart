import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nexotrack/Models/portfolio_model.dart';
import 'package:nexotrack/Screnes/AddCoin.dart';

class FuncPro extends ChangeNotifier {
  addcoinpro(PortfolioModel Addcoin) {
    var box = Hive.box("mycoin");
    box.add(Addcoin);
    notifyListeners();
  }

  TotalAmnt(PortfolioModel Addcoin) {
    var totalamnt = Addcoin.qty + Addcoin.buyPrice;

    notifyListeners();
    // final total =
  }
}
