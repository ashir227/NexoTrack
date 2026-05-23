import 'package:flutter/widgets.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Servise/Api.dart';

class CryptoPro extends ChangeNotifier {
  CryptoModel? user;
  List<CryptoModel> Coinslst = [];
  bool isload = false;
  String? error;
  CryptoApi apis = CryptoApi();
  Future<void> fetchcoin(BuildContext context) async {
    isload = true;
    error = null;
    notifyListeners();
    try {
      Coinslst = await apis.get();
    } catch (e) {
      error = e.toString();
    }

    isload = false;
    notifyListeners();
  }
}
