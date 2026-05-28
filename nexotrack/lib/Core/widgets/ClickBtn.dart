import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Screnes/MainScr.dart';

class ClickBtn extends StatelessWidget {
  VoidCallback onpressed;
  String text;
  EdgeInsets padding;
  ClickBtn({
    super.key,
    required this.padding,
    required this.onpressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: PrimaryColor.BtnColor,

        padding: padding,
      ),

      onPressed: onpressed,

      child: Text(
        text,
        style: TextStyle(color: SecColor.textwhclr, fontSize: w * 0.05),
      ),
    );
  }
}
