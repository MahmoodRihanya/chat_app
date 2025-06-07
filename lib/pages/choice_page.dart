import 'package:chat/constants.dart';
import 'package:chat/pages/ai_tools_page.dart';
import 'package:chat/pages/chat_page.dart';

import 'package:chat/widgets/choice.dart';
import 'package:flutter/material.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });
  static final String ID = 'ChoicePage';
  final bool isDark;
  final VoidCallback onToggleTheme;
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Chat with...', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Choice(
              onTap: () {
                Navigator.pushNamed(context, AiToolsPage.ID);
              },
              text: 'AI',
              backgroundColor: kSecondaryColor,
              textAndShadowColor: kAiColor,
            ),
            Spacer(flex: 1),
            IconButton(onPressed: onToggleTheme, icon: Icon(Icons.dark_mode)),
            Spacer(flex: 1),
            Choice(
              onTap: () {
                Navigator.pushNamed(context, ChatPage.ID, arguments: email);
              },
              text: 'Friends',
              backgroundColor: kPrimaryColor,
              textAndShadowColor: kFriendColor,
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
