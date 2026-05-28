import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/ClickBtn.dart';
import 'package:nexotrack/Core/widgets/Custmtxtfld.dart';
import 'package:nexotrack/Core/widgets/text.dart';
import 'package:nexotrack/Provider/LoginPro.dart';
import 'package:nexotrack/Screnes/MainScr.dart';

class LoginScr extends StatelessWidget {
  const LoginScr({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.height;
    TextEditingController passcontrol = TextEditingController();
    return Scaffold(
      backgroundColor: PrimaryColor.BckColor,
      body: Center(
        child: Container(
          // color: Colors.yellow,
          padding: EdgeInsets.symmetric(horizontal: w * 0.01),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/nt_logo_option5_1.jpg",
                width: w * 0.7,
                height: h * 0.3,
              ),
              reusetext(
                context: context,
                clr: SecColor.textwhclr,
                Size: w * 0.06,
                txt: "NexoTrack",
                FontWeight: FontWeight.w700,
              ),
              reusetext(
                context: context,
                clr: SecColor.textgrclr,
                Size: w * 0.025,
                txt: "Track. Trade. Thrive.",
                FontWeight: FontWeight.w700,
              ),
              SizedBox(height: h * 0.05),
              reusetext(
                context: context,
                clr: SecColor.textwhclr,
                Size: w * 0.028,
                txt: "Email Address",
                FontWeight: FontWeight.w700,
              ),
              CstmFld(validator: (value) {}, controller: passcontrol),
              SizedBox(height: h * 0.02),
              reusetext(
                context: context,
                clr: SecColor.textwhclr,
                Size: w * 0.028,
                txt: "Password",
                FontWeight: FontWeight.w700,
              ),
              CstmFld(validator: (value) {}, controller: passcontrol),
              SizedBox(height: h * 0.04),
              ClickBtn(
                padding: EdgeInsets.symmetric(
                  vertical: h * 0.020,
                  horizontal: w * 0.21,
                ),
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Mainnscr()),
                  );
                },
                text: "Sign In",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
