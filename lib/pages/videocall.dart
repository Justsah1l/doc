import 'package:appointease/components/custombutton.dart';
import 'package:appointease/services/zego.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

class videocall extends StatefulWidget {
  const videocall({super.key});

  @override
  State<videocall> createState() => _videocallState();
}

class _videocallState extends State<videocall> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("call"),
              Custombutton(
                  text: "call",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => callzego(
                                callID: "1234",
                              )),
                    );
                  })
            ],
          )),
    );
  }
}
