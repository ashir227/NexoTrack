import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      isExpanded: true,
      dropdownColor: PrimaryColor.BckColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: PrimaryColor.CrdColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: SecColor.borderclr.withOpacity(0.6),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(9),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: SecColor.borderclr.withOpacity(0.6),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(9),
        ),
      ),

      hint: Text("Select Coin", style: TextStyle(color: SecColor.textwhclr)),

      value: selectedcoin,

      items: coins.map((coin) {
        return DropdownMenuItem<CryptoModel>(
          value: coin,

          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              // color: PrimaryColor.CrdColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${coin.name[0].toUpperCase()}${coin.name.substring(1).toLowerCase()}",
                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(color: SecColor.textwhclr),
                ),
                Text(
                  "\$ ${NumberFormat('#,##0.000').format(coin.price)}",
                  overflow: TextOverflow.ellipsis,
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
