import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String sender;
  final String senderemail;
  final String rec;
  final String mes;
  final Timestamp time;

  Message({
    required this.sender,
    required this.senderemail,
    required this.rec,
    required this.mes,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderid': sender,
      'senderemail': senderemail,
      'recieverid': rec,
      'message': mes,
      'time': time,
    };
  }
}
