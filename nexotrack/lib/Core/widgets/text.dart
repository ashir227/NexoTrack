import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';

Widget reusetext({
  required BuildContext context,
  required Color clr,
  required double Size,
  required String txt,
  required FontWeight,
}) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  // String? txt;
  return Text(
    txt,
    textAlign: TextAlign.right,
    style: TextStyle(color: clr, fontSize: Size, fontWeight: FontWeight),
  );
}
