import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Models/portfolio_model.dart';

class FuncPro extends ChangeNotifier {
  List<PortfolioModel> MyCoin = [];
  // late CryptoModel itemapi;
  addcoinpro(PortfolioModel addcoin) {
    MyCoin.add(addcoin);
    var box = Hive.box("mycoin");
    box.add(addcoin);
    notifyListeners();
  }

  currentpercent(PortfolioModel Addcoin, double currentPrice) {
    var percent = ((currentPrice - Addcoin.buyPrice) / Addcoin.buyPrice) * 100;

    return percent;
  }

  loadcoinlist() {
    var box = Hive.box("mycoin");
    MyCoin = box.values.cast<PortfolioModel>().toList();
    notifyListeners();
  }
}
