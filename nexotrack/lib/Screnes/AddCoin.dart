import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';

class Addcoin extends StatelessWidget {
  const Addcoin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor.BckColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Add Cryptocurrency",
            style: TextStyle(color: SecColor.textwhclr),
          ),
        ],
      ),
    );
  }
}
