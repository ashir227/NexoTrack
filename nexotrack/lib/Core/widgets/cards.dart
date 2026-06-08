import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';

Widget Cards(
  BuildContext context,
  String txt,
  // String txt7,
  String value,
  String txt2, {
  Color? valueColor,
  Color? valueColor2,
}) {
  double w = MediaQuery.of(context).size.width;
  double h = MediaQuery.of(context).size.height;

  return SizedBox(
    height: h * 0.16,
    width: w * 0.30,
    child: Card(
      margin: EdgeInsets.zero,
      color: PrimaryColor.CrdColor,
      elevation: 6,
      shadowColor: SecColor.borderclr,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      txt,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: w * 0.04,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 142, 141, 141),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: w * 0.02),
            Flexible(
              child: Text(
                value,

                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: w * 0.06,
                  fontWeight: FontWeight.w700,
                  color: valueColor2 ?? SecColor.textwhclr,
                ),
              ),
            ),
            SizedBox(height: w * 0.02),
            Flexible(
              child: Text(
                txt2,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: w * 0.04,
                  fontWeight: FontWeight.w700,
                  color: valueColor ?? SecColor.textgrclr,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
