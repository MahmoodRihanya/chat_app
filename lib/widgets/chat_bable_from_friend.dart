import 'package:chat/constants.dart';
import 'package:chat/models/message_model.dart';
import 'package:chat/widgets/chat_bable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_reactions/flutter_chat_reactions.dart';
import 'package:flutter_chat_reactions/utilities/hero_dialog_route.dart';

// ignore: must_be_immutable
class ChatBableFromFriend extends StatelessWidget {
  ChatBableFromFriend({required this.message});
  MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onLongPress: () {
          Navigator.of(context).push(
            HeroDialogRoute(
              builder: (context) {
                return ReactionsDialogWidget(
                  id: message.id,
                  messageWidget: ChatBable(message: message),
                  onReactionTap: (reaction) {
                    print('reaction: $reaction');

                    if (reaction == '➕') {
                    } else {}
                  },
                  onContextMenuTap: (menuItem) {
                    print('menu item: $menuItem');
                  },
                );
              },
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.all(15),

          padding: EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 20),
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          child: Text(message.message, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
