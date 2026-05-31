import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';

Widget ElevBtn({
  required BuildContext context,
  required VoidCallback onpressed,
  required String text,
  required double width,
  required double height,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [SecColor.borderclr, const Color.fromARGB(255, 45, 71, 113)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onpressed,
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: SecColor.textwhclr,
          ),
        ),
      ),
    ),
  );
}
