import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
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
      dropdownColor: PrimaryColor.BckColor,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: SecColor.borderclr),
          borderRadius: BorderRadius.circular(9),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: SecColor.borderclr),
          borderRadius: BorderRadius.circular(9),
        ),
      ),

      hint: Text("Select Coin", style: TextStyle(color: SecColor.textwhclr)),

      value: selectedcoin,

      items: coins.map((coin) {
        return DropdownMenuItem<CryptoModel>(
          value: coin,

          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              // color: PrimaryColor.CrdColor,
            ),
            child: Row(
              children: [
                Text(
                  coin.name.toUpperCase(),
                  style: TextStyle(color: SecColor.textwhclr),
                ),
              ],
            ),
          ),
        );
      }).toList(),

      onChanged: onChanged,
    );
  }
}
