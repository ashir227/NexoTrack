import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Provider/ApiPro.dart';
import 'package:nexotrack/Servise/connectivity_check.dart';
import 'package:provider/provider.dart';

class Coinlist extends StatefulWidget {
  const Coinlist({super.key});

  @override
  State<Coinlist> createState() => _CoinlistState();
}

class _CoinlistState extends State<Coinlist> {
  @override
  Widget build(BuildContext context) {
    List<CryptoModel> Coinslst = [];
    bool isload = true;
    bool nointernet = false;
    loadlist();
    return Scaffold(
      appBar: AppBar(title: Text("My Holdings", textAlign: TextAlign.start)),

      body: Consumer<CryptoPro>(
        builder: (context, provider, child) {
          if (provider.isload) {
            return CircularProgressIndicator();
          }
          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }
          if (provider.Coinslst.isEmpty) {
            return const Center(child: Text("No Data Found"));
          }
        },
      ),
    );
  }
}
