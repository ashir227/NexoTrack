import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/text.dart';

class holdcoininfo extends StatelessWidget {
  String text;
  String text2;

  holdcoininfo({super.key, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      padding: EdgeInsets.only(left: w * 0.03, top: 0.03),
      height: h * 0.15,
      width: w * 0.35,
      color: PrimaryColor.CrdColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: h * 0.01),

          reusetext(
            context: context,
            clr: SecColor.textgrclr,
            Size: w * 0.043,
            txt: text,
            FontWeight: FontWeight.w300,
          ),
          SizedBox(height: h * 0.008),
          reusetext(
            context: context,
            clr: SecColor.textwhclr,
            Size: w * 0.058,
            txt: text2,
            FontWeight: FontWeight.w400,
          ),
          SizedBox(height: h * 0.006),

          reusetext(
            context: context,
            clr: SecColor.textwhclr,
            Size: w * 0.040,
            txt: text2,
            FontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
