import 'package:appointease/components/custombutton.dart';
import 'package:appointease/components/customtextfield.dart';
import 'package:appointease/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Registerp extends StatefulWidget {
  Registerp({super.key, required this.onTap});
  void Function()? onTap;

  @override
  State<Registerp> createState() => _RegisterpState();
}

List<String> options = ["Paitent", "Doctor"];

class _RegisterpState extends State<Registerp> {
  bool isvis = false;
  String currop = options[0];
  TextEditingController email = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController pass = TextEditingController();

  TextEditingController conpass = TextEditingController();
  void su() async {
    if (pass.text == conpass.text) {
      if (currop == "Paitent") {
        final authser = Provider.of<Authservice>(context, listen: false);
        try {
          await authser.suem(email.text, pass.text);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                e.toString(),
              ),
            ),
          );
        }
      } else {
        final authser = Provider.of<Authservice>(context, listen: false);
        try {
          await authser.suemdoc(email.text, pass.text, desc.text);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                e.toString(),
              ),
            ),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password doesnt match with confirm password"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/reg.json", height: 170, width: 170),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Lets create your account !",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Customtextfield(
                  hinttext: "Email",
                  obsure: false,
                  controller: email,
                ),
                Customtextfield(
                  hinttext: "Password",
                  obsure: true,
                  controller: pass,
                ),
                Customtextfield(
                  hinttext: "Confirm Password",
                  obsure: true,
                  controller: conpass,
                ),
                Visibility(
                  visible: isvis,
                  child: Customtextfield(
                    hinttext: "Description",
                    obsure: false,
                    controller: desc,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Paitent',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Radio(
                          value: options[0],
                          groupValue: currop,
                          onChanged: (value) {
                            setState(() {
                              currop = value.toString();
                              isvis = false;
                            });
                          },
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Doctor',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Radio(
                          value: options[1],
                          groupValue: currop,
                          onChanged: (value) {
                            setState(() {
                              currop = value.toString();
                              isvis = true;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Custombutton(
                  onTap: su,
                  text: "Sign up",
                ),
                // Text.rich(
                //   TextSpan(
                //       text: "Not a member ?",
                //       children: [TextSpan(text: "Resgister now")]),
                // )
                SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a Member ?  ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
