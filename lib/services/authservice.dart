import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Authservice extends ChangeNotifier {
  final FirebaseAuth _fauth = FirebaseAuth.instance;

  Future<UserCredential> siem(String email, String password) async {
    try {
      UserCredential userCredential = await _fauth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> suem(String email, String password) async {
    try {
      UserCredential userCredential = await _fauth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> sout() async {
    return await FirebaseAuth.instance.signOut();
  }
}
