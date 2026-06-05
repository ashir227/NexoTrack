import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Models/portfolio_model.dart';
import 'package:nexotrack/Provider/ApiPro.dart';
import 'package:provider/provider.dart';

class FuncPro extends ChangeNotifier {
  List<PortfolioModel> MyCoin = [];
  // late CryptoModel itemapi;
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

  searchcoin(BuildContext context, index) {
    final mycoin = context.read<FuncPro>().MyCoin[index].name;
    final apicoin = context.read<CryptoPro>().Coinslst[index];
    final nameapi = apicoin.name;
    if (mycoin == nameapi) {
      for (var lsst in MyCoin) {
        return apicoin.change24h;
      }
    }
  }
}
