import 'package:appointease/components/custombutton.dart';
import 'package:appointease/pages/appointment.dart';
import 'package:appointease/pages/chatpage.dart';
import 'package:flutter/material.dart';

class docprofile extends StatefulWidget {
  String name = "";
  String desc = "";
  String docid = "";
  docprofile(
      {required this.name, required this.desc, required this.docid, super.key});

  @override
  State<docprofile> createState() => _docprofileState();
}

class _docprofileState extends State<docprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 120,
              width: 120,
              child: Icon(
                Icons.person_2,
                size: 50,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Name - ${widget.name}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Description - ${widget.desc}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Custombutton(
                text: "Message",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => chatpage(
                              name: widget.name ?? "",
                              recid: widget.docid,
                            )),
                  );
                }),
            SizedBox(
              height: 10,
            ),
            Custombutton(
                text: "Take appointment",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            appointmentpage(docname: widget.name)),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
