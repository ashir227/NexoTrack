import 'package:flutter/material.dart';
import 'package:nexotrack/Models/ApiModel.dart';

class Drop extends StatelessWidget {
  final List<CryptoModel> coins;
  final CryptoModel? selectedcoin;
  final Function(CryptoModel?) onChanged;

  const Drop({
    super.key,
    required this.onChanged,
    required this.coins,
    required this.selectedcoin,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CryptoModel>(
      value: selectedcoin,
      items: coins.map((coin) {
        return DropdownMenuItem(value: coin, child: Text(coin.name));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
