import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/text.dart';

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
                  TextField(),
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
