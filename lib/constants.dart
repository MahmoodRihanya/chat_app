import 'package:chat/models/ai_tool_model.dart';
import 'package:flutter/material.dart';

final Color kPrimaryColor = Color(0xff2B475E);
final Color kSecondaryColor = Color(0xff006D84);
final Color kAiColor = Colors.redAccent;
final Color kFriendColor = Colors.greenAccent;
final String kmessage = 'message';
final String kcreatedAt = 'createdAt';
final String kid = 'id';
final String prefixLogo = 'assets/images/log/';

class Urls {
  static final String chatgpt = 'https://chat.openai.com/';
  static final String gemini = 'https://gemini.google.com/';
  static final String claude = 'https://claude.ai/';
  static final String bign = 'https://www.perplexity.ai/';
  static final String deepseek = 'https://deepseek.com/chat';
}

class logo {
  static final String chatgpt = '${prefixLogo}chatGPT.png';
  static final String gemini = '${prefixLogo}gemini.png';
  static final String claude = '${prefixLogo}claude.png';
  static final String bign = '${prefixLogo}bing.jpg';
  static final String deepseek = '${prefixLogo}deepseek.png';
}

List<AiToolModel> toolsList = [
  AiToolModel(image: logo.chatgpt, text: 'Chat GPT', url: Urls.chatgpt),
  AiToolModel(image: logo.deepseek, text: 'DeepSeek', url: Urls.deepseek),
  AiToolModel(image: logo.gemini, text: 'Gemini', url: Urls.gemini),
  AiToolModel(image: logo.claude, text: 'Claude', url: Urls.claude),
  AiToolModel(image: logo.bign, text: 'Bign', url: Urls.bign),
];
