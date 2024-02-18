import 'package:appointease/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void sout() {
    final authser = Provider.of<Authservice>(context, listen: false);
    authser.sout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Center(
        child: IconButton(onPressed: sout, icon: Icon(Icons.exit_to_app)),
      ),
    );
  }
}
