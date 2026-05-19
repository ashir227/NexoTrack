import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/cards.dart';

class Mainnscr extends StatelessWidget {
  const Mainnscr({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: PrimaryColor.BckColor,
      body: Column(
        children: [
          SizedBox(height: h * 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Cards(
                context,
                "Total Value",
                Icons.abc_outlined,
                PrimaryColor.ProftClr,
                "value",
              ),
              Cards(
                context,
                "Invested",
                Icons.abc_outlined,
                PrimaryColor.ProftClr,
                "value",
              ),
              Cards(
                context,
                "Profit/Loss",
                Icons.abc_outlined,
                PrimaryColor.ProftClr,
                "value",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
