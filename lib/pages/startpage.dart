import 'package:appointease/pages/docprofile.dart';
import 'package:appointease/pages/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';

class Startpage extends StatefulWidget {
  const Startpage({super.key});

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    auth.currentUser?.email ?? "User",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                },
                icon: Icon(Icons.person_2),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(5),
              height: 200,
              width: 360,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Lottie.asset("assets/login.json", height: 90),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Find the best Doctors",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Popular Doctors",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: userlist())
        ],
      ),
    );
  }

  Widget userlist() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("doc").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("loading");
        }
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => userlistitem(doc))
              .toList(),
        );
      },
    );
  }

  Widget userlistitem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    if (auth.currentUser!.email != data['email']) {
      return Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: Icon(Icons.person_3),
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            data['email'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [Text("Speciality - "), Text(data['desc'] ?? "Unknown")],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => docprofile(
                        name: data['email'] ?? "",
                        desc: data['desc'] ?? "Unknown",
                        docid: data['uid'] ?? "",
                      )),
            );
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
