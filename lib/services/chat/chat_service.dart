import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:responsive_chat_app/model/message.dart';

class ChatService {
//get indtance of auth and firestore

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //  SEND MESSAGES

  Future<void> sendeMessage(String reciverId, String message) async {
    // get current user info
    final currentUserId = _firebaseAuth.currentUser!.uid;
    final currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final timeStamp = Timestamp.now();

//  create a new message

    Message newMessage = Message(
        message: message,
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        reciverId: reciverId,
        timeStamp: timeStamp);

//  construct chat rom id from current user id and reciver id (sorted to ensure )

    List<String> ids = [currentUserId, reciverId];
    ids.sort(); // sort the ids into a single string to use as a chatroomId
    String chatRoomId = ids.join("_");

// add new message to database

    await _fireStore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toMap())
        // ignore: avoid_print
        .then((value) => print("User Added"))
        // ignore: avoid_print
        .catchError((error) => print("Failed to add user: $error"));
  }

  //  GET MESSAGES

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
// construct chat room id from user ids sorted to user ensure it mathces the id used when sending message
    // print("Fetching Messages"); // Add this line

    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    // Debug print

    return _fireStore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timeStamp", descending: false)
        .snapshots();
  }
}
