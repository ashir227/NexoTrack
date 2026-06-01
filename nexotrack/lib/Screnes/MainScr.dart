import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/cards.dart';
import 'package:nexotrack/Core/widgets/elevButn.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Models/portfolio_model.dart';
import 'package:nexotrack/Provider/ApiPro.dart';
import 'package:nexotrack/Provider/FunctionsPro.dart';
import 'package:nexotrack/Screnes/AddCoin.dart';
import 'package:nexotrack/Screnes/CoinLists.dart';
import 'package:nexotrack/Screnes/coindetail.dart';
import 'package:provider/provider.dart';

class Mainnscr extends StatelessWidget {
  const Mainnscr({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final mycoin = context.read<FuncPro>().MyCoin;
    // final secpro = context.watch<CryptoModel>();
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
                            builder: (context) => coindetails(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: h * 0.008),
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
                              color: Colors.grey.shade300,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: w * 0.02,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    prolist.name,
                                    style: TextStyle(color: SecColor.textwhclr),
                                  ),
                                  Text(
                                    prolist.qty.toString(),
                                    style: TextStyle(color: SecColor.textwhclr),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    prolist.totalinvest.toString(),
                                    style: TextStyle(color: SecColor.textwhclr),
                                  ),
                                  // Text(
                                  //   // secpro.change24h.toString(),
                                  //   // style: TextStyle(color: SecColor.textwhclr),
                                  // ),
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
