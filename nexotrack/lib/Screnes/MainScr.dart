import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/cards.dart';
import 'package:nexotrack/Core/widgets/elevButn.dart';
import 'package:nexotrack/Screnes/AddCoin.dart';
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
          SizedBox(height: h * 0.06),
          ElevBtn(
            paddings: EdgeInsets.symmetric(horizontal: 0.06, vertical: 0.04),
            context: context,
            text:
                "📊 View All Coins Prices \n See current rates of all cryptocurrencies",
            onpressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Coinlist()),
              );
            },
          ),
          SizedBox(height: h * 0.05),
          ElevBtn(
            paddings: EdgeInsets.symmetric(horizontal: 0.06, vertical: 0.04),
            context: context,
            text: "Add Cryptocurrency",
            onpressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Addcoin()),
              );
            },
          ),
        ],
      ),
    );
  }
}
