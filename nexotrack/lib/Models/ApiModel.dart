// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CryptoModel welcomeFromJson(String str) =>
    CryptoModel.fromJson(json.decode(str));

String welcomeToJson(CryptoModel data) => json.encode(data.toJson());

class CryptoModel {
  Map<String, double> bitcoin;
  Map<String, double> cardano;
  Map<String, double> dogecoin;
  Map<String, double> ethereum;
  Map<String, double> litecoin;
  Map<String, double> polkadot;
  Map<String, double> ripple;
  Map<String, double> solana;

  CryptoModel({
    required this.bitcoin,
    required this.cardano,
    required this.dogecoin,
    required this.ethereum,
    required this.litecoin,
    required this.polkadot,
    required this.ripple,
    required this.solana,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) => CryptoModel(
    bitcoin: Map.from(
      json["bitcoin"],
    ).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    cardano: Map.from(
      json["cardano"],
    ).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    dogecoin: Map.from(
      json["dogecoin"],
    ).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    ethereum: Map.from(
      json["ethereum"],
    ).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    litecoin: Map.from(
      json["litecoin"],
    ).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    polkadot: Map.from(
      json["polkadot"],
    ).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    ripple: Map.from(
      json["ripple"],
    ).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    solana: Map.from(
      json["solana"],
    ).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "bitcoin": Map.from(bitcoin).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "cardano": Map.from(cardano).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "dogecoin": Map.from(
      dogecoin,
    ).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "ethereum": Map.from(
      ethereum,
    ).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "litecoin": Map.from(
      litecoin,
    ).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "polkadot": Map.from(
      polkadot,
    ).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "ripple": Map.from(ripple).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "solana": Map.from(solana).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
