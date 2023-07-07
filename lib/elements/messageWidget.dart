import 'package:flutter/material.dart';



class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key? key,
    required this.sender,
    required this.text,
    required this.timestamp,
    required this.isMe,
  }) : super(key: key);

  final String? sender;
  final String? text;
  final DateTime timestamp;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: 
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$sender',
            style: const TextStyle(
              fontSize: 12.0,
              color: Color.fromARGB(255, 97, 95, 95),
            ),
          ),
          Material(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            elevation: 5,
             color: !isMe ? Colors.lightBlue : Color.fromARGB(255, 229, 130, 8),
            
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                '$text',
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
