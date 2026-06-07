import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Models/portfolio_model.dart';
import 'package:nexotrack/Provider/ApiPro.dart';
import 'package:nexotrack/Screnes/AddCoin.dart';
import 'package:nexotrack/Screnes/CoinLists.dart';
import 'package:provider/provider.dart';

class FuncPro extends ChangeNotifier {
  List<PortfolioModel> MyCoin = [];

  String? addcoinpro(
    PortfolioModel addcoin,
    String coinName,
    BuildContext context,
  ) {
    final index = MyCoin.indexWhere((cs) => cs.name == addcoin.name);
    var box = Hive.box("mycoin");

    if (index == -1) {
      MyCoin.add(addcoin);
      box.add(addcoin);
    } else {
      final oldCoin = MyCoin[index];

      final totalQty = oldCoin.qty + addcoin.qty;

      final totalInvested = oldCoin.totalinvest + addcoin.totalinvest;

      final avgBuyPrice = totalInvested / totalQty;

      final updatedCoin = PortfolioModel(
        name: oldCoin.name,
        qty: totalQty,
        buyPrice: avgBuyPrice,
        totalinvest: totalInvested,
      );

      MyCoin[index] = updatedCoin;

      box.putAt(index, updatedCoin);
    }
    notifyListeners();
    return null;
  }

  double currentpercent(PortfolioModel Addcoin, double currentPrice) {
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
      total += coin.totalinvest;
    }

    return total;
  }

  // double getTotalPercent(BuildContext context) {
  //   double totalper = 0;
  //   final mycoin = context.read<FuncPro>().MyCoin;
  //   for (var coins in MyCoin) {
  //     final apicoins = mycoin.firstWhere(test)
  //   }
  // }

  double getTotalCurrentValue(BuildContext context) {
    double total = 0;

    final apiList = context.read<CryptoPro>().Coinslst;

    for (var coin in MyCoin) {
      final apiCoin = apiList.firstWhere(
        (c) => c.name == coin.name,
        orElse: () => CryptoModel(name: coin.name, price: 0, change24h: 0),
      );

      total += coin.qty * apiCoin.price;
    }

    return total;
  }

  String formatAmount(double value) {
    if (value >= 1000000) {
      return "${(value / 1000000).toStringAsFixed(1)}M";
    }

    if (value >= 10000) {
      return "${(value / 1000).toStringAsFixed(1)}K";
    }

    return NumberFormat('#,##0').format(value);
  }
}
