import 'package:chat/firebase_options.dart';
import 'package:chat/pages/ai_tools_page.dart';
import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/choice_page.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/register_page.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChatApp());
}

// ignore: must_be_immutable
class ChatApp extends StatefulWidget {
  ChatApp({super.key});
  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,

        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      routes: {
        LoginPage.ID: (context) => LoginPage(),
        RegisterPage.ID: (context) => RegisterPage(),
        ChatPage.ID: (context) => ChatPage(),
        ChoicePage.ID:
            (context) =>
                ChoicePage(isDark: _isDark, onToggleTheme: _toggleTheme),
        AiToolsPage.ID: (context) => AiToolsPage(),
      },

      initialRoute: LoginPage.ID,
    );
  }

  void _toggleTheme() {
    setState(() {
      _isDark = !_isDark;
    });
  }
}
