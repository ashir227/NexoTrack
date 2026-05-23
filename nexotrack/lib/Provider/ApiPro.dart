import 'package:flutter/widgets.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Servise/Api.dart';

class CryptoPro extends ChangeNotifier {
  CryptoModel? user;
  List<CryptoModel> Coinslst = [];
  bool _loadcoiin = true;
  CryptoApi apis = CryptoApi();
}
