import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/elevButn.dart';
import 'package:nexotrack/Core/widgets/infoCardmainscr.dart';
import 'package:nexotrack/Core/widgets/text.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Models/portfolio_model.dart';
import 'package:nexotrack/Provider/ApiPro.dart';
import 'package:nexotrack/Provider/FunctionsPro.dart';
import 'package:nexotrack/Screnes/AddCoin.dart';
import 'package:nexotrack/Screnes/Sell.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

class coindetails extends StatelessWidget {
  final PortfolioModel coin;

  const coindetails({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    final funcpro = context.read<FuncPro>();

    final currentRate = funcpro.getCurrent(context, coin.name);

    final currentValue = coin.qty * currentRate;
    final profitLoss = currentValue - coin.totalinvest;

    final getCoinpercent = (funcpro.getTotalInvested() == 0)
        ? 0
        : ((coin.totalinvest / funcpro.getTotalInvested()) * 100);
    final percentProfit = (coin.totalinvest == 0)
        ? 0
        : (profitLoss / coin.totalinvest) * 100;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.05,
            vertical: h * 0.05,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("a"),

                  reusetext(
                    context: context,
                    clr: SecColor.textwhclr,
                    Size: w * 0.06,
                    txt:
                        "${coin.name[0].toUpperCase()}${coin.name.substring(1).toLowerCase()}",
                    FontWeight: FontWeight.w500,
                  ),
                  ElevBtn(
                    context: context,
                    onpressed: () {
                      funcpro.deleteCoin(coin.name);
                      Navigator.pop(context);
                    },
                    text: "d",
                    width: w * 0.06,
                    height: h * 0.08,
                  ),
                ],
              ),

              Image.asset(
                "assets/images/c_logo.jpg",
                height: h * 0.20,
                width: w * 0.40,
              ),

              SizedBox(height: h * 0.02),

              // ✅ CURRENT PRICE SAFE
              reusetext(
                context: context,
                clr: SecColor.textwhclr,
                Size: 45,
                txt:
                    "\$${NumberFormat('#,##0.00').format(currentRate.isNaN ? 0 : currentRate)}",
                FontWeight: FontWeight.w500,
              ),

              // CHANGE 24H SAFE
              Builder(
                builder: (context) {
                  final change = funcpro.getChange(context, coin.name);

                  return reusetext(
                    context: context,
                    clr: change >= 0 ? Colors.green : Colors.red,
                    Size: 18,
                    txt: "${change.toStringAsFixed(2)}% today",
                    FontWeight: FontWeight.w800,
                  );
                },
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
                    text: "AVG BUY PRICE",
                    text2:
                        "\$${NumberFormat('#,##0.00').format(coin.totalinvest)}",
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
                    text: "Coin Share",
                    text2:
                        "${NumberFormat('#,##0.00').format(getCoinpercent)}%",
                    text3: "Total % Portfolio",
                  ),
                ],
              ),
              SizedBox(height: h * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevBtn(
                    context: context,
                    onpressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Addcoin()),
                      );
                    },
                    text: "Buy More",
                    width: w * 0.3,
                    height: h * 0.08,
                  ),
                  ElevBtn(
                    context: context,
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SellCoin(coins: coin),
                        ),
                      );
                    },
                    text: "Delete",
                    width: w * 0.3,
                    height: h * 0.08,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
