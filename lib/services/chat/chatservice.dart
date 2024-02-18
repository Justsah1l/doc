import 'package:appointease/model/msmod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class chatservice extends ChangeNotifier {
  final FirebaseAuth _fauth = FirebaseAuth.instance;
  final FirebaseFirestore _fstore = FirebaseFirestore.instance;

  Future<void> sendm(String recid, String message) async {
    final String curur = _fauth.currentUser!.uid;
    final String curem = _fauth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    Message newm = Message(
        sender: curur,
        senderemail: curem,
        rec: recid,
        mes: message,
        time: timestamp);

    List<String> ids = [curur, recid];
    ids.sort();
    String chatid = ids.join("_");
    await _fstore
        .collection('chats')
        .doc(chatid)
        .collection('messages')
        .add(newm.toMap());
  }

  Stream<QuerySnapshot> getmes(String userid, String recid) {
    List<String> ids = [userid, recid];
    ids.sort();
    String chatid = ids.join("_");
    return _fstore
        .collection('chats')
        .doc(chatid)
        .collection('messages')
        .orderBy('time', descending: false)
        .snapshots();
  }
}
