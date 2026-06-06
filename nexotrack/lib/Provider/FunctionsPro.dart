import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Models/portfolio_model.dart';
import 'package:nexotrack/Provider/ApiPro.dart';
import 'package:nexotrack/Screnes/CoinLists.dart';
import 'package:provider/provider.dart';

class FuncPro extends ChangeNotifier {
  List<PortfolioModel> MyCoin = [];

  String? addcoinpro(PortfolioModel addcoin) {
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

  double getChange(BuildContext context, String coinName) {
    final apiList = context.read<CryptoPro>().Coinslst;

    final coin = apiList.firstWhere((c) => c.name == coinName);

    return coin.change24h;
  }

  double getCurrent(BuildContext context, String coinName) {
    final apiList = context.read<CryptoPro>().Coinslst;
    final apicoin = apiList.firstWhere((cs) => cs.name == coinName);
    return apicoin.price;
  }

  double getTotalInvested() {
    double total = 0;

    for (var coin in MyCoin) {
      total = coin.totalinvest + coin.totalinvest;
    }

    return total;
  }

  double getTotalCurrentValue(BuildContext context) {
    double total = 0;

    final apiList = context.read<CryptoPro>().Coinslst;

    for (var coin in MyCoin) {
      final apiCoin = apiList.firstWhere((c) => c.name == coin.name);

      total += coin.qty * apiCoin.price;
    }

    return total;
  }
}
