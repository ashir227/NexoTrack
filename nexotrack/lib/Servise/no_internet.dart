import 'package:flutter/material.dart';

class nointernet extends StatelessWidget {
  const nointernet({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/no_internet.png", height: h * 0.02),
        ],
      ),
    );
  }
}
