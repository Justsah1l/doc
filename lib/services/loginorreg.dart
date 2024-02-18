import 'package:appointease/pages/loginpage.dart';
import 'package:appointease/pages/registerpage.dart';
import 'package:flutter/material.dart';

class Loginorreg extends StatefulWidget {
  const Loginorreg({super.key});

  @override
  State<Loginorreg> createState() => _LoginorregState();
}

class _LoginorregState extends State<Loginorreg> {
  bool showlogin = true;
  void toggle() {
    setState(() {
      showlogin = !showlogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showlogin) {
      return Loginpage(
        onTap: toggle,
      );
    } else {
      return Registerp(
        onTap: toggle,
      );
    }
  }
}
