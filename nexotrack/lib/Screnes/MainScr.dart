import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/cards.dart';
import 'package:nexotrack/Screnes/CoinLists.dart';

class Mainnscr extends StatelessWidget {
  const Mainnscr({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Portfolio",
          style: TextStyle(
            color: SecColor.textwhclr,
            fontSize: w * 0.1,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: PrimaryColor.BckColor,
      ),
      backgroundColor: PrimaryColor.BckColor,
      body: Column(
        children: [
          SizedBox(height: h * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Cards(context, "Total Value", "value"),
              Cards(context, "Invested", "value"),
              Cards(context, "Profit/Loss", 'value'),
            ],
          ),
          SizedBox(height: h * 0.05),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),

              padding: EdgeInsets.symmetric(
                horizontal: w * 0.05,
                vertical: h * 0.02,
              ),
              backgroundColor: PrimaryColor.BtnColor,
              foregroundColor: SecColor.textwhclr,
              elevation: w * 0.7,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Coinlist()),
              );
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
        ],
      ),
    );
  }
}
