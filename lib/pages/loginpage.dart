import 'package:appointease/components/custombutton.dart';
import 'package:appointease/components/customtextfield.dart';
import 'package:appointease/pages/emergency.dart';
import 'package:appointease/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key, required this.onTap});
  void Function()? onTap;

  @override
  State<Loginpage> createState() => _LoginpageState();
}

List<String> options = ["Paitent", "Doctor"];

class _LoginpageState extends State<Loginpage> {
  String currop = options[0];
  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();
  void ontap() async {
    final authser = Provider.of<Authservice>(context, listen: false);
    if (currop == "Paitent") {
      try {
        await authser.siem(email.text, pass.text);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    } else
      try {
        await authser.siemdoc(email.text, pass.text);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/login.json",
                repeat: true,
              ),

              //////

              SizedBox(
                height: 30,
              ),
              Text(
                "Welcome Back !",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Customtextfield(
                hinttext: "Username",
                obsure: false,
                controller: email,
              ),
              Customtextfield(
                hinttext: "Password",
                obsure: true,
                controller: pass,
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
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
              Custombutton(
                onTap: ontap,
                text: "Login",
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
                    "Not a Member ?  ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Emergency()),
                  );
                },
                child: Text(
                  "Emergency Contacts",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
