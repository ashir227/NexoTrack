import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nexotrack/Provider/FunctionsPro.dart';
import 'package:nexotrack/Screnes/Login.dart';
import 'package:nexotrack/Screnes/MainScr.dart';
import 'package:provider/provider.dart';

class SpalshScr extends StatefulWidget {
  const SpalshScr({super.key});

  @override
  State<SpalshScr> createState() => _SpalshScrState();
}

class _SpalshScrState extends State<SpalshScr> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<FuncPro>(context, listen: false).loadcoinlist();
    });
    Future.delayed(const Duration(seconds: 4), () {
      var box = Hive.box("login");
      bool islogin = box.get("islogin", defaultValue: false);
      if (islogin) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Mainnscr()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScr()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/splash_pic.jpg",
          // width: w * 0.5,
          // height: h * 0.25,
          fit: BoxFit.fill,
          errorBuilder: (c, e, s) {
            return const Text("Image not loaded");
          },
        ),
      ),
    );
  }
}
