import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Models/ApiModel.dart';

class AmountCrd extends StatelessWidget {
  final CryptoModel? selcoin;
  const AmountCrd({super.key, this.selcoin});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.only(
        // horizontal: w * 0.02,
        // top: h * 0.02,
        left: w * 0.02,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [PrimaryColor.BtnColor, PrimaryColor.CrdColor],
        ),
        color: PrimaryColor.CrdColor,
        borderRadius: BorderRadius.circular(8),
      ),
      height: h * 0.145,
      width: w * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current Market Price",
                style: TextStyle(
                  color: const Color.fromARGB(255, 215, 215, 215),
                  fontSize: w * 0.043,
                ),
              ),
              Text(
                selcoin == null
                    ? "Select coin first"
                    : "\$ ${selcoin!.price.toString()}",
                style: TextStyle(
                  color: SecColor.textwhclr,
                  fontSize: w * 0.065,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Text(
                    selcoin == null
                        ? "Select coin first"
                        : "${selcoin!.change24h.toStringAsFixed(2)}%",
                    style: TextStyle(
                      color: (selcoin?.change24h ?? 0) >= 0
                          ? Colors.green
                          : Colors.red,
                      fontSize: w * 0.05,
                    ),
                  ),
                  SizedBox(width: w * 0.014),
                  Icon(
                    (selcoin?.change24h ?? 0) >= 0
                        ? Icons.trending_up
                        : Icons.trending_down,
                    color: (selcoin?.change24h ?? 0) >= 0
                        ? Colors.green
                        : Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
