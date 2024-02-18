import 'package:appointease/components/custombutton.dart';
import 'package:appointease/components/customtextfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class appointmentpage extends StatefulWidget {
  String docname;
  appointmentpage({required this.docname, super.key});

  @override
  State<appointmentpage> createState() => _appointmentpageState();
}

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore _fstore = FirebaseFirestore.instance;

class _appointmentpageState extends State<appointmentpage> {
  Future<void> bookapo() async {
    _fstore.collection("appointments").add({
      "name": name.text,
      "age": age.text,
      "symptoms": symptom.text,
      "date": date,
      "docid": widget.docname,
      "userid": auth.currentUser!.uid,
    });
  }

  String userid = auth.currentUser!.uid;
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController symptom = TextEditingController();
  String date = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Lets make your appointment",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            Customtextfield(
                controller: name, obsure: false, hinttext: 'enter your name'),
            Customtextfield(
                controller: age, obsure: false, hinttext: 'enter your age'),
            Customtextfield(
                controller: symptom,
                obsure: false,
                hinttext: 'enter your symptoms'),
            Text(
              "Select date",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () async {
                DateTime? pickeddate = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100));
                String formattedDate = DateFormat('yyyy-MM-dd')
                    .format(pickeddate ?? DateTime.now());
                setState(() {
                  date = formattedDate;
                });
              },
              icon: Icon(Icons.calendar_month),
              iconSize: 50,
            ),
            SizedBox(
              height: 20,
            ),
            Custombutton(
                text: "Book",
                onTap: () {
                  bookapo();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Appointment booked"),
                    ),
                  );
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
