import 'package:flutter/material.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Servise/connectivity_check.dart';

class Coinlist extends StatelessWidget {
  const Coinlist({super.key});

  @override
  Widget build(BuildContext context) {
    List<CryptoModel> Coinslst = [];
    bool isload = true;
    bool nointernet = false;
    loadlist();
    return const Placeholder();
  }
}
