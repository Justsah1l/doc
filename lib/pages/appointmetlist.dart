import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class appointfetch extends StatefulWidget {
  const appointfetch({super.key});

  @override
  State<appointfetch> createState() => _appointfetchState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

class _appointfetchState extends State<appointfetch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Your Appointments",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: appoinlist()),
        ],
      ),
    );
  }

  Widget appoinlist() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("appointments").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("loading");
        }
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => appointmentlist(doc))
              .toList(),
        );
      },
    );
  }

  Widget appointmentlist(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    if (auth.currentUser!.uid == data['userid']) {
      return Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: Icon(Icons.person_3),
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            "Appointment at - ${data['docid']}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [Text("Date - "), Text(data['date'] ?? "Unknown")],
          ),
          onTap: () {},
        ),
      );
    } else {
      return Container();
    }
  }
}
