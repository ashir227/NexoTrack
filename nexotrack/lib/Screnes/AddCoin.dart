import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/Custmtxtfld.dart';
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
  CryptoModel? selcoin;
  @override
  Widget build(BuildContext context) {
    final Amntcontroller = TextEditingController();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var pro = context.watch<CryptoPro>();
    // var pros = context.watch<CryptoModel>();

    // CryptoModel? selcoin;
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusetext(
                    context: context,
                    clr: SecColor.textwhclr,
                    Size: w * 0.05,
                    txt: "Select Cryptocurrency",
                    FontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: h * 0.01),
                  Drop(
                    selectedcoin: selcoin,
                    onChanged: (value) {
                      setState(() {
                        selcoin = value;
                      });
                    },
                    coins: pro.Coinslst,
                  ),
                  SizedBox(height: h * 0.04),
                  reusetext(
                    context: context,
                    clr: SecColor.textwhclr,
                    Size: w * 0.05,
                    txt: "Amount (How much you own)",
                    FontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: h * 0.01),
                  CstmFld(
                    validator: (value) {
                      if (value == null) {
                        return "Please enter Valid Qty";
                      }
                    },
                    controller: Amntcontroller,
                  ),
                  Container(
                    height: h * 0.5,
                    width: w * 0.7,
                    child: Column(
                      children: [
                        Text(
                          "Current Market Price",
                          style: TextStyle(color: SecColor.textwhclr),
                        ),
                        Text(
                          selcoin == null
                              ? "Select coin first"
                              : selcoin!.price.toString(),
                          style: TextStyle(color: SecColor.textwhclr),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
