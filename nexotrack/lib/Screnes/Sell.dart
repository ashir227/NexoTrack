import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/Custmtxtfld.dart';
import 'package:nexotrack/Core/widgets/elevButn.dart';
import 'package:nexotrack/Core/widgets/text.dart';
import 'package:nexotrack/Models/portfolio_model.dart';
import 'package:nexotrack/Screnes/MainScr.dart';
import 'package:provider/provider.dart';
import 'package:nexotrack/Provider/FunctionsPro.dart';

class SellCoin extends StatefulWidget {
  // final String coinName;
  final PortfolioModel coins;

  const SellCoin({super.key, required this.coins});

  @override
  State<SellCoin> createState() => _SellCoinState();
}

class _SellCoinState extends State<SellCoin> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController qtyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final funcpro = context.read<FuncPro>();
    final currentrate = funcpro.getCurrent(context, widget.coins.name);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: PrimaryColor.BckColor,

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              reusetext(
                context: context,
                clr: SecColor.textwhclr,
                Size: w * 0.07,
                txt: "Sell Coin",
                FontWeight: FontWeight.w600,
              ),
              SizedBox(height: h * 0.03),
              reusetext(
                context: context,
                clr: SecColor.textwhclr,
                Size: w * 0.06,
                txt: "\$${widget.coins.name}",
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
                    "\$${NumberFormat('#,##0.00').format(currentrate.isNaN ? 0 : currentrate)}",
                FontWeight: FontWeight.w500,
              ),
              reusetext(
                context: context,
                clr: SecColor.textgrclr,
                Size: w * 0.04,
                txt: "Current Market Price",
                FontWeight: FontWeight.w500,
              ),

              Text("Sell ${widget.coins.name}"),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    reusetext(
                      context: context,
                      clr: SecColor.textwhclr,
                      Size: w * 0.05,
                      txt: "SELL QUANTITY",
                      FontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: h * 0.017),
                    CstmFld(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter valid qty";
                        }

                        double? numm = double.tryParse(value);

                        if (numm == null) {
                          return "Enter valid qty";
                        }

                        if (numm <= 0) {
                          return "Qty must be greater than 0";
                        }
                        if (numm > widget.coins.qty) {
                          return "Please Enter available Qty";
                        }

                        return null;
                      },
                      controller: qtyController,
                    ),
                  ],
                ),
              ),

              SizedBox(height: h * 0.25),

              ElevBtn(
                context: context,
                onpressed: () {
                  if (_formKey.currentState!.validate()) {
                    final qty = double.tryParse(qtyController.text) ?? 0;

                    context.read<FuncPro>().sellCoin(widget.coins.name, qty);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Mainnscr()),
                    );
                  }
                },
                text: "Sell",

                width: w * 0.9,
                height: h * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
