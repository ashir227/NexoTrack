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
          const SizedBox(height: 20),
          const Text(
            "Ooops!",
            style: TextStyle(
              fontSize: 25,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "No internet connection found.\nCheck your connection or try again.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
