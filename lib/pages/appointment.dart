import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class appointmentpage extends StatefulWidget {
  String docid;
  appointmentpage({required this.docid, super.key});

  @override
  State<appointmentpage> createState() => _appointmentpageState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

class _appointmentpageState extends State<appointmentpage> {
  String userid = auth.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
