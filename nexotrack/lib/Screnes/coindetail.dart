import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/infoCardmainscr.dart';
import 'package:nexotrack/Core/widgets/text.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Models/portfolio_model.dart';
import 'package:nexotrack/Provider/ApiPro.dart';
import 'package:nexotrack/Provider/FunctionsPro.dart';
import 'package:provider/provider.dart';
// import 'package:nexotrack/Provider/FunctionsPro.dart';
// import 'package:nexotrack/Services/Api.dart';
// import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class coindetails extends StatelessWidget {
  final PortfolioModel coin;

  const coindetails({super.key, required this.coin});

  // get index => null;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    // final apipro = context.watch<CryptoApi>();
    final funcpro = context.read<FuncPro>();
    final apipro = context.read<CryptoPro>();
    final currentValue = coin.qty * funcpro.getCurrent(context, coin.name);
    final profitLoss =
        ((funcpro.getCurrent(context, coin.name) * coin.qty) -
        coin.totalinvest);
    final percentProfit = (profitLoss / coin.totalinvest) * 100;
    // CryptoModel cryptoModel;
    // final PortfolioModel coin;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.05),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            reusetext(
              context: context,
              clr: SecColor.textwhclr,
              Size: w * 0.06,
              txt:
                  "${coin.name[0].toUpperCase()}${coin.name.substring(1).toLowerCase()}",
              FontWeight: FontWeight.w500,
            ),
            Image.asset(
              "assets/images/c_logo.jpg",
              height: h * 0.20,
              width: w * 0.40,
            ),

            SizedBox(height: h * 0.02),

            reusetext(
              context: context,
              clr: SecColor.textwhclr,
              Size: 45,
              txt:
                  "\$${NumberFormat('#,##0.00').format(funcpro.getCurrent(context, coin.name))}",
              FontWeight: FontWeight.w500,
            ),

            reusetext(
              context: context,
              clr: funcpro.getChange(context, coin.name) >= 0
                  ? Colors.green
                  : Colors.red,
              Size: 18,
              txt:
                  "${funcpro.getChange(context, coin.name).toStringAsFixed(2)}% today",
              FontWeight: FontWeight.w800,
            ),
            SizedBox(height: h * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                holdcoininfo(
                  text: "HOLDINGS",
                  text2: "${NumberFormat('#,##0.0').format(coin.qty)} Coins",
                  text3: "\$${NumberFormat('#,##0.00').format(currentValue)}",
                ),
                holdcoininfo(
                  text: "BUY PRICE",
                  text2:
                      "\$${NumberFormat('#,##0.00').format((coin.totalinvest))}",
                  text3: "Total Invested",
                ),
              ],
            ),
            SizedBox(height: h * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                holdcoininfo(
                  text: "PROFIT/LOSS",
                  text2: "\$${NumberFormat('#,##0.0').format(profitLoss)}",
                  text2Style: TextStyle(
                    color: profitLoss >= 0
                        ? PrimaryColor.ProftClr
                        : PrimaryColor.LossClr,
                    fontSize: w * 0.058,
                    fontWeight: FontWeight.w600,
                  ),
                  text3: "${NumberFormat('#,##0.00').format(percentProfit)}%",
                  text3Style: TextStyle(
                    color: percentProfit >= 0
                        ? PrimaryColor.ProftClr
                        : PrimaryColor.LossClr,
                    fontSize: w * 0.040,
                  ),
                ),
                holdcoininfo(
                  text: "BUY PRICE",
                  text2:
                      "\$${NumberFormat('#,##0.00').format((coin.totalinvest))}",
                  text3: "Total Invested",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
