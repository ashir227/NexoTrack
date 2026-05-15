import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';

class LoginScr extends StatelessWidget {
  const LoginScr({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.height;
    TextEditingController passcontrol = TextEditingController();
    return Scaffold(
      backgroundColor: PrimaryColor.BckColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: w * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: SecColor.borderclr),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            SizedBox(height: h * 0.02),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: SecColor.borderclr),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            SizedBox(height: h * 0.02),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: PrimaryColor.BtnColor,

                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.18,
                  vertical: h * 0.016,
                ),
              ),
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: w * 0.023,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
