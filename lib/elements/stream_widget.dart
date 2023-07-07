import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'messageWidget.dart';

class StreamBuilderWidget extends StatelessWidget {
  StreamBuilderWidget({Key? key, required this.loggedInUser}) : super(key: key);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? loggedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          _firestore.collection('messages').orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data?.docs;
          if (messages != null) {
            List<MessageWidget> messageWidgets = [];
            for (var message in messages) {
              final messageData = message.data() as Map<String, dynamic>;

              final messageText = messageData['text'];
              final messageSender = messageData['sender'];
              final timestamp = messageData['timestamp'];

              final currentUser = loggedInUser?.email;

              // Pour ne pas afficher des messages null
              if (messageText != null &&
                  messageSender != null &&
                  timestamp != null &&
                  timestamp is Timestamp) {
                final convertedTimestamp = timestamp.toDate();
                final messageWidget = MessageWidget(
                  sender: messageSender,
                  text: messageText,
                  timestamp: convertedTimestamp,
                  isMe: currentUser == messageSender,
                );

                messageWidgets.add(messageWidget);
              }
            }

            // Trier les messages par ordre chronologique
            messageWidgets.sort((a, b) => b.timestamp.compareTo(a.timestamp));

            // Renverser l'ordre des messages
            messageWidgets = messageWidgets.reversed.toList();

            return Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                children: messageWidgets,
              ),
            );
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
