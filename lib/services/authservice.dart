import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Authservice extends ChangeNotifier {
  final FirebaseAuth _fauth = FirebaseAuth.instance;
  final FirebaseFirestore _fstore = FirebaseFirestore.instance;

  Future<UserCredential> siem(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _fauth.signInWithEmailAndPassword(
          email: email, password: password);
      _fstore.collection("users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true));
      /* _fstore.collection("users").add({
        'uid': userCredential.user!.uid,
        'email': email,
      }); */
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> siemdoc(String email, String password) async {
    try {
      UserCredential userCredential = await _fauth.signInWithEmailAndPassword(
          email: email, password: password);
      _fstore.collection("doc").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> suem(String email, String password) async {
    try {
      UserCredential userCredential = await _fauth
          .createUserWithEmailAndPassword(email: email, password: password);
      _fstore.collection("users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> suemdoc(
      String email, String password, String desc) async {
    try {
      UserCredential userCredential = await _fauth
          .createUserWithEmailAndPassword(email: email, password: password);
      _fstore.collection("doc").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'desc': desc,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> sout() async {
    return await FirebaseAuth.instance.signOut();
  }
}
