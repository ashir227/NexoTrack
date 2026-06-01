import 'package:flutter/material.dart';
import 'package:nexotrack/Core/theme/color.dart';
import 'package:nexotrack/Core/widgets/ClickBtn.dart';
import 'package:nexotrack/Core/widgets/Custmtxtfld.dart';
import 'package:nexotrack/Core/widgets/text.dart';
import 'package:nexotrack/Provider/LoginPro.dart';
import 'package:nexotrack/Screnes/MainScr.dart';
import 'package:provider/provider.dart';

class LoginScr extends StatelessWidget {
  LoginScr({super.key});
  TextEditingController mailcntrl = TextEditingController();
  TextEditingController passcntrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.height;
    // TextEditingController passcontrol = TextEditingController();
    return Scaffold(
      backgroundColor: PrimaryColor.BckColor,
      body: SingleChildScrollView(
        child: Center(
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
                CstmFld(
                  validator: (value) {
                    if (value == null) {
                      return "Please enter valid mail";
                    }
                  },
                  controller: mailcntrl,
                ),
                SizedBox(height: h * 0.02),
                reusetext(
                  context: context,
                  clr: SecColor.textwhclr,
                  Size: w * 0.028,
                  txt: "Password",
                  FontWeight: FontWeight.w700,
                ),
                CstmFld(
                  key: _formKey,
                  validator: (value) {
                    if (value == null) {
                      return "Please enter valid password";
                    }
                    int? numm = int.tryParse(value);
                    if (numm == null) {
                      return "Please enter valid password";
                    }
                    if (numm! < 0) {
                      return "Please enter positive value";
                    }
                  },
                  controller: passcntrl,
                ),
                SizedBox(height: h * 0.04),
                ClickBtn(
                  padding: EdgeInsets.symmetric(
                    vertical: h * 0.018,
                    horizontal: w * 0.18,
                  ),
                  onpressed: () {
                    final password = (passcntrl.text);

                    final result = Provider.of<LoginPro>(
                      context,
                      listen: false,
                    ).islogin(mailcntrl.text, password);
                    if (result) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Mainnscr()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please Enter valid Mail or Password"),
                        ),
                      );
                    }
                  },

                  text: "Sign In",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
