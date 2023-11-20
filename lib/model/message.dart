import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String reciverId;
  final String message;
  final Timestamp timeStamp;

  Message({
    required this.message,
    required this.senderId,
    required this.senderEmail,
    required this.reciverId,
    required this.timeStamp,
  });

  Map<String, dynamic> toMap() {
    return {
      "senderId": senderId,
      "senderEmail": senderEmail,
      "reciverId": reciverId,
      "message": message,
      "timeStamp": timeStamp,
    };
  }
}
