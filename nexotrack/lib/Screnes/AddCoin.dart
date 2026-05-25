import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';

class Addcoin extends StatelessWidget {
  const Addcoin({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: PrimaryColor.BckColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.07),
            Text(
              "Add Cryptocurrency",

              style: TextStyle(
                color: SecColor.textwhclr,
                fontSize: w * 0.08,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: h * 0.04),
            Text("Select Cryptocurrency"),
          ],
        ),
      ),
    );
  }
}
