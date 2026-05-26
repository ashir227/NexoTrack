import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/drop_down.dart';
import 'package:nexotrack/Core/widgets/text.dart';
import 'package:nexotrack/Models/ApiModel.dart';
import 'package:nexotrack/Provider/ApiPro.dart';
import 'package:provider/provider.dart';

class Addcoin extends StatefulWidget {
  const Addcoin({super.key});

  @override
  State<Addcoin> createState() => _AddcoinState();
}

class _AddcoinState extends State<Addcoin> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var pro = context.watch<CryptoPro>();
    CryptoModel? selcoin;
    return Scaffold(
      backgroundColor: PrimaryColor.BckColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.07),
            reusetext(
              context: context,
              clr: SecColor.textwhclr,
              Size: w * 0.08,
              txt: "Add Cryptocurrency",
              FontWeight: FontWeight.w700,
            ),
            SizedBox(height: h * 0.04),

            Form(
              child: Column(
                children: [
                  reusetext(
                    context: context,
                    clr: SecColor.textwhclr,
                    Size: w * 0.05,
                    txt: "Select Cyyptocurrency",
                    FontWeight: FontWeight.w700,
                  ),
                  Drop(
                    selectedcoin: selcoin,
                    onChanged: (value) {
                      setState(() {
                        selcoin = value;
                      });
                    },
                    coins: pro.Coinslst,
                  ),
                  TextField(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
