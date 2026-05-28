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

        padding: EdgeInsets.symmetric(
          horizontal: w * 0.18,
          vertical: h * 0.016,
        ),
      ),

      onPressed: onpressed,

      child: Text(text),
    );
  }
}
