import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';

Widget reusetext({
  required BuildContext context,
  required Color clr,
  required Size,
  required String txt,
}) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  // String? txt;
  return Text(
    txt,

    style: TextStyle(
      color: SecColor().textwhclr,
      fontSize: w * 0.08,
      fontWeight: FontWeight.w700,
    ),
  );
}
