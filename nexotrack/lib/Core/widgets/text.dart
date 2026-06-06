import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';

Widget reusetext({
  required BuildContext context,
  required String txt,
  required Color clr,
  required double Size,
  required FontWeight,
  TextStyle? style,
}) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  // String? txt;
  return Text(
    txt,
    style:
        style ?? TextStyle(color: clr, fontSize: Size, fontWeight: FontWeight),
  );
}
