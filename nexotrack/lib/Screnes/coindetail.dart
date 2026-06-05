import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/text.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Models/portfolio_model.dart';
import 'package:nexotrack/Provider/FunctionsPro.dart';
import 'package:provider/provider.dart';
// import 'package:nexotrack/Provider/FunctionsPro.dart';
// import 'package:nexotrack/Services/Api.dart';
// import 'package:provider/provider.dart';

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
              clr: SecColor.borderclr,
              Size: 20,
              txt: "${coin.totalinvest}",
              FontWeight: FontWeight.w800,
            ),

            reusetext(
              context: context,
              clr: SecColor.borderclr,
              Size: 20,
              txt: funcpro.getChange(context, coin.name).toString(),
              FontWeight: FontWeight.w800,
            ),
          ],
        ),
      ),
    );
  }
}
