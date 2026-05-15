import 'package:flutter/material.dart';
import 'package:nexotrack/Screnes/Login.dart';

class SpalshScr extends StatefulWidget {
  const SpalshScr({super.key});

  @override
  State<SpalshScr> createState() => _SpalshScrState();
}

class _SpalshScrState extends State<SpalshScr> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScr()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(child: Image.asset("assets/images/Splashpic.png")),
      ),
    );
  }
}
