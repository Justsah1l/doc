import 'package:appointease/components/customtextfield.dart';
import 'package:appointease/services/chat/chatservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class chatpage extends StatefulWidget {
  String name;
  String recid;
  chatpage({required this.name, required this.recid, super.key});

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  TextEditingController mescon = TextEditingController();
  chatservice chatser = chatservice();
  FirebaseAuth _fauth = FirebaseAuth.instance;
  void sendm() async {
    if (mescon.text.isNotEmpty) {
      await chatser.sendm(widget.recid, mescon.text);
      mescon.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name ?? "user"),
      ),
      body: Column(
        children: [
          Expanded(
            child: messagelist(),
          ),
          textforin()
        ],
      ),
    );
  }

  Widget messagelist() {
    return StreamBuilder(
      stream: chatser.getmes(_fauth.currentUser!.uid, widget.recid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading ..");
        }
        return ListView(
            children: snapshot.data!.docs
                .map((document) => messagelistitem(document))
                .toList());
      },
    );
  }

  Widget messagelistitem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var align = (data['senderid'] == _fauth.currentUser!.uid
        ? Alignment.centerRight
        : Alignment.centerLeft);
    return Container(
      alignment: align,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: (data['senderid'] == _fauth.currentUser!.uid
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start),
          children: [
            Container(
              width: 90,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: (data['senderid'] == _fauth.currentUser!.uid
                      ? const Color.fromARGB(255, 101, 229, 106)
                      : Colors.yellow)),
              child: Center(
                  child: Text(
                data['message'],
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
      ),
    );
  }

  Widget textforin() {
    return Row(
      children: [
        Expanded(
            child: Customtextfield(
                controller: mescon, obsure: false, hinttext: "enter here")),
        IconButton(onPressed: sendm, icon: Icon(Icons.send)),
      ],
    );
  }
}
