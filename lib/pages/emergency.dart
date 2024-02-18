import 'package:appointease/components/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Emergency Contacts",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          height: 400,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.call,
                    size: 45,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "AMBULANCE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Custombutton(
                      text: "call",
                      onTap: () async {
                        final Uri url = Uri(scheme: 'tel', path: '102');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          print("cant call");
                        }
                      })
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.call,
                    size: 45,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "POLICE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Custombutton(
                      text: "call",
                      onTap: () async {
                        final Uri url = Uri(scheme: 'tel', path: '100');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          print("cant call");
                        }
                      })
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.call,
                    size: 45,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "FIRE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Custombutton(
                      text: "call",
                      onTap: () async {
                        final Uri url = Uri(scheme: 'tel', path: '101');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          print("cant call");
                        }
                      })
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.call,
                    size: 45,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "NATIONAL EMERGENCY NUMBER",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  Custombutton(
                      text: "call",
                      onTap: () async {
                        final Uri url = Uri(scheme: 'tel', path: '112');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          print("cant call");
                        }
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
