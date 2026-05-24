import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
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
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CryptoPro>().fetchcoin();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<CryptoModel> Coinslst = [];
    bool isload = true;
    bool nointernet = false;
    loadlist();
    return Scaffold(
      backgroundColor: PrimaryColor.BckColor,
      appBar: AppBar(title: Text("My Holdings", textAlign: TextAlign.start)),

      body: Consumer<CryptoPro>(
        builder: (context, provider, child) {
          if (provider.isload) {
            return Center(
              child: CircularProgressIndicator(color: PrimaryColor.BtnColor),
            );
          }
          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }
          if (provider.Coinslst.isEmpty) {
            return const Center(child: Text("No Data Found"));
          }
          return ListView.builder(
            itemCount: provider.Coinslst.length,
            itemBuilder: (context, index) {
              final coin = provider.Coinslst[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
                child: ListTile(
                  tileColor: SecColor.textfldbg,
                  title: Text(
                    coin.name,
                    style: TextStyle(color: SecColor.textwhclr),
                  ),

                  subtitle: Text(
                    "${coin.price}",
                    style: TextStyle(color: SecColor.textgrclr),
                  ),
                  trailing: Text(
                    "${coin.change24h.toStringAsFixed(2)}%",
                    style: TextStyle(
                      color: coin.change24h >= 0 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
