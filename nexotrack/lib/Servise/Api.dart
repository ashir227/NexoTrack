import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:http/http.dart' as http;

class CryptoApi {
  final String baseurl =
      "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,solana,cardano,ripple,polkadot,litecoin,dogecoin&vs_currencies=usd&include_24hr_change=true";
  Future<List<CryptoModel>> get(BuildContext context, dynamic resbody) async {
    try {
      var url = Uri.parse(baseurl);
      var res = await http.get(url);
      if (res.statusCode == 200) {
        final resbody = jsonDecode(res.body);
        return resbody.map((e) => CryptoModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to Catch :${res.statusCode}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar
      (content: Text("$e")));
      return [];
    }
  }
}
