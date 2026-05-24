import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Screnes/CoinLists.dart';

Widget ElevBtn(BuildContext context, callback) {
  CallbackAction? callback;
  double w = MediaQuery.of(context).size.width;
  double h = MediaQuery.of(context).size.height;
  return DecoratedBox(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [SecColor.borderclr, const Color.fromARGB(255, 45, 71, 113)],
      ),
      borderRadius: BorderRadius.circular(11),
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
        backgroundColor: Colors.transparent, // ← ADD THIS
        shadowColor: Colors.transparent, // ← ADD THIS
        foregroundColor: SecColor.textwhclr,
        elevation: 0, // ← OR THIS
      ),
      onPressed: () {
        callback;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "📊 View All Coins Prices",
            style: TextStyle(fontSize: w * 0.05),
          ),
          Text("See current rates of all cryptocurrencies"),
        ],
      ),
    ),
  );
}
