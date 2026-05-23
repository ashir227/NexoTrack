import 'package:flutter/widgets.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Servise/Api.dart';

class CryptoPro extends ChangeNotifier {
  CryptoModel? user;
  List<CryptoModel> Coinslst = [];
  bool isload = false;
  CryptoApi apis = CryptoApi();
  Future<void> fetchcoin(BuildContext context) async {
    isload = true;
    notifyListeners();

    Coinslst = await apis.get(context);

    isload = false;
    notifyListeners();
  }
}
