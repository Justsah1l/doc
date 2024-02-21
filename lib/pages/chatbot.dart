import 'dart:developer';

import 'package:appointease/components/custombutton.dart';
import 'package:appointease/components/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final gemini = Gemini.instance;
  TextEditingController userin = TextEditingController();
  TextEditingController ans = TextEditingController();
  TextEditingController an = TextEditingController();
  void sendmsg() async {
    try {
      await gemini
          .text(userin.text)
          .then((value) => ans.text = value?.output ?? "")

          /// or value?.content?.parts?.last.text
          .catchError((e) => print(e));
      print("----------ans ------  ${ans.text}");
      setState(() {
        an.text = ans.text;
      });
    } catch (e) {}
  }

  final List<Map<String, String>> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chatbot",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Ask your queries",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Customtextfield(
                  controller: userin, obsure: false, hinttext: "enter"),
              Center(
                child: Custombutton(
                    text: "text",
                    onTap: () {
                      an.clear();
                      sendmsg();
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          an.text ?? "Thinking....",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
