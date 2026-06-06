import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/cards.dart';
import 'package:nexotrack/Core/widgets/elevButn.dart';
import 'package:nexotrack/Core/widgets/text.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Models/portfolio_model.dart';
import 'package:nexotrack/Provider/ApiPro.dart';
import 'package:nexotrack/Provider/FunctionsPro.dart';
import 'package:nexotrack/Screnes/AddCoin.dart';
import 'package:nexotrack/Screnes/CoinLists.dart';
import 'package:nexotrack/Screnes/Coindetail.dart';
import 'package:provider/provider.dart';

class Mainnscr extends StatelessWidget {
  const Mainnscr({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // final mycoin = context.watch<FuncPro>().MyCoin;
    PortfolioModel coin;
    CryptoModel apicoin;
    // final secpro = context.read<CryptoModel>();
    // CryptoModel apipro;
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
      body: Consumer<FuncPro>(
        builder: (context, pro, _) {
          return Column(
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
                context: context,
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Coinlist()),
                  );
                },
                text: "📊 View All Coins Prices",
                width: w * 0.9,
                height: h * 0.07,
              ),
              SizedBox(height: h * 0.05),
              ElevBtn(
                context: context,
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Addcoin()),
                  );
                },
                text: "Add Cryptocurrency",
                width: w * 0.9,
                height: h * 0.06,
              ),
              SizedBox(height: h * 0.02),
              Container(
                margin: EdgeInsets.symmetric(horizontal: w * 0.03),
                width: double.infinity,
                decoration: BoxDecoration(color: PrimaryColor.CrdColor),
                child: reusetext(
                  context: context,
                  clr: SecColor.textwhclr,
                  Size: w * 0.07,
                  txt: "Your Holdings",
                  FontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: h * 0.009),
              Expanded(
                child: ListView.builder(
                  itemCount: pro.MyCoin.length,
                  itemBuilder: (context, index) {
                    final prolist = pro.MyCoin[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => coindetails(coin: prolist),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: h * 0.008,
                          horizontal: w * 0.03,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: h * 0.015,
                          horizontal: w * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: PrimaryColor.CrdColor,
                          borderRadius: BorderRadius.circular(w * 0.02),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: const Color.fromARGB(255, 60, 125, 190),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${prolist.name[0].toUpperCase()}${prolist.name.substring(1).toLowerCase()}",
                                    style: TextStyle(
                                      color: SecColor.textwhclr,
                                      fontSize: w * 0.055,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "${prolist.qty.toString()} coins",
                                    style: TextStyle(color: SecColor.textgrclr),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "\$${NumberFormat('#,##0.00').format(prolist.totalinvest)}",
                                    style: TextStyle(
                                      color: SecColor.textwhclr,
                                      fontSize: w * 0.05,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  // Text((" ${mycoin.currentpercent(prolist, currentPrice)}")),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
