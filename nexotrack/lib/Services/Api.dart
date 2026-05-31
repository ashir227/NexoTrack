import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:http/http.dart' as http;

class CryptoApi {
  // List<CryptoModel> Coinslst = [];
  final String baseurl =
      "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,tether,binancecoin,solana,cardano,ripple,polkadot,dogecoin,avalanche-2,polygon,litecoin,uniswap,chainlink,cosmos,monero,bitcoin-cash,stellar,vechain,filecoin,aptos,aave,arbitrum,optimism,fantom,hedera-hashgraph,internet-computer,near,algorand,tezos,sui,flow,elrond,harmony,zcash,tron,ethereum-classic,dash,decentraland,the-sandbox,axie-infinity,yearn-finance,curve-dao-token,lido-dao,maker,usdcoin,staked-eth&vs_currencies=usd&include_24hr_change=true";
  Future<List<CryptoModel>> get() async {
    try {
      var url = Uri.parse(baseurl);
      var res = await http.get(url);

      if (res.statusCode == 200) {
        final resbody = jsonDecode(res.body);
        List<CryptoModel> Coinslst = [];
        resbody.forEach((key, value) {
          Coinslst.add(CryptoModel.fromJson(key, value));
        });
        return Coinslst;
      } else {
        throw Exception("Server Error:${res.statusCode}");
      }
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }
}
