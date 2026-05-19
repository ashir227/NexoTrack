import 'package:flutter/material.dart';
// import 'package:matflow/providers/addmatlist.dart';
// import 'package:provider/provider.dart';

Widget Cards(
  // SizedBox sizex,
  BuildContext context,
  String txt,
  IconData icon,
  Color iconColor,
  String value,
) {
  double w = MediaQuery.of(context).size.width;
  double h = MediaQuery.of(context).size.height;
  // final matqty = context.watch<AddmatProvider>().material.length;
  // final unitcnt = context.watch<AddmatProvider>().unitcount;
  return SizedBox(
    height: h * 0.16,
    width: w * 0.46,
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
            Row(
              children: [
                Text(
                  txt,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 142, 141, 141),
                  ),
                ),
                SizedBox(width: w * 0.15),
                Icon(icon, color: iconColor, size: 27),
              ],
            ),

            Text(
              value,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    ),
  );
}
