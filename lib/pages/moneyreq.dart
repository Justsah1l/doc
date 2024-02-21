import 'package:appointease/components/custombutton.dart';
import 'package:appointease/pages/upipage.dart';
import 'package:flutter/material.dart';

class reqmon extends StatefulWidget {
  String docid = "";
  reqmon({required this.docid, super.key});

  @override
  State<reqmon> createState() => _reqmonState();
}

class _reqmonState extends State<reqmon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      "Almost there",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Your appointment will be with Doctor - ${widget.docid}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Your sub total is X Rs. Now you will proceed for payment",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Custombutton(
                  text: "Cancel",
                  onTap: () {
                    Navigator.pop(context);
                  }),
              Custombutton(
                  text: " Pay ",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => upipage()),
                    );
                  })
            ],
          )
        ],
      ),
    );
  }
}
