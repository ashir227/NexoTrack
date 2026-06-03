import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';

class coindetails extends StatelessWidget {
  const coindetails({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: PrimaryColor.BckColor,
      body: Column(
        children: [
          Card(
            shadowColor: SecColor.borderclr,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 7,

            margin: EdgeInsets.symmetric(
              horizontal: w * 0.05,
              vertical: h * 0.02,
            ),
            color: PrimaryColor.CrdColor,
            // margin: EdgeInsets.all(w * 0.05),
            child: Padding(padding: EdgeInsets.all(w * 0.9), child: Column()),
          ),
        ],
      ),
    );
  }
}
