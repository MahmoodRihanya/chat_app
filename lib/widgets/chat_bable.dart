import 'package:chat/constants.dart';
import 'package:chat/models/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatBable extends StatelessWidget {
  ChatBable({required this.message});
  MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(15),

        padding: EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 20),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Text(message.message, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
