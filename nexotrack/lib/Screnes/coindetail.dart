import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/text.dart';

class coindetails extends StatelessWidget {
  const coindetails({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/c_logo.jpg",
              height: h * 0.25,
              width: w * 0.45,
            ),

            SizedBox(height: h * 0.02),

            reusetext(
              context: context,
              clr: SecColor.borderclr,
              Size: 20,
              txt: "txt",
              FontWeight: FontWeight.w800,
            ),
          ],
        ),
      ),
    );
  }
}
