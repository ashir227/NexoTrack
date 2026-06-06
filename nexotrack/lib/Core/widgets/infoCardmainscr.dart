import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/text.dart';

class holdcoininfo extends StatelessWidget {
  String text;
  String text2;
  String text3;
  TextStyle? text3Style;
  TextStyle? text2Style;
  holdcoininfo({
    super.key,
    required this.text,
    required this.text2,
    required this.text3,
    this.text3Style,
    this.text2Style,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(left: w * 0.03, top: 0.03),
      height: h * 0.17,
      width: w * 0.40,
      decoration: BoxDecoration(
        color: PrimaryColor.CrdColor,
        borderRadius: BorderRadius.circular(w * 0.02),
        boxShadow: [BoxShadow(blurRadius: 5, color: SecColor.borderclr)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: h * 0.01),

          reusetext(
            context: context,
            clr: SecColor.textgrclr,
            Size: w * 0.043,
            txt: text,
            FontWeight: FontWeight.w400,
          ),
          SizedBox(height: h * 0.008),
          reusetext(
            context: context,
            clr: SecColor.textwhclr,
            Size: w * 0.058,
            txt: text2,
            FontWeight: FontWeight.w500,
            style: text2Style,
          ),
          SizedBox(height: h * 0.006),

          reusetext(
            context: context,
            clr: SecColor.textgrclr,
            Size: w * 0.040,
            txt: text3,
            FontWeight: FontWeight.w400,
            style: text3Style,
          ),
        ],
      ),
    );
  }
}
