import 'package:flutter/material.dart';

Widget Cards(BuildContext context, String txt, String value) {
  double w = MediaQuery.of(context).size.width;
  double h = MediaQuery.of(context).size.height;

  return SizedBox(
    height: h * 0.16,
    width: w * 0.30,
    child: Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      elevation: 3.5,
      shadowColor: const Color.fromARGB(255, 207, 205, 205),
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
                  fontSize: w * 0.045,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
