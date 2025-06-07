import 'package:chat/constants.dart';
import 'package:chat/helper/scroll_down.dart';
import 'package:chat/models/message_model.dart';
import 'package:chat/pages/choice_page.dart';
import 'package:chat/widgets/chat_bable.dart';
import 'package:chat/widgets/chat_bable_from_friend.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_reactions/widgets/stacked_reactions.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  static final String ID = 'ChatPage';

  TextEditingController controller = TextEditingController();
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder(
      stream: messages.orderBy(kcreatedAt).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(MessageModel.fromjson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 60,
                    width: 60,
                  ),
                  Text('Chat', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      if (messageList[index].id == email) {
                        return ChatBable(message: messageList[index]);
                      } else {
                        return Stack(
                          children: [
                            ChatBableFromFriend(message: messageList[index]),
                            Positioned(
                              bottom: 4,
                              right: 20,
                              child: StackedReactions(
                                reactions: [],

                                stackedValue: 4.0,
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: controller,

                    onSubmitted: (data) {
                      messages.add({
                        kmessage: data,
                        kcreatedAt: DateTime.now(),
                        kid: email,
                      });
                      controller.clear();
                      scrollDown();
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Messge',
                      suffixIcon: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ChoicePage.ID);
                        },
                        icon: Icon(Icons.send, color: kPrimaryColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            ),
          );
        }
      },
    );
  }
}
