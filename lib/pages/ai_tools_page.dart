import 'package:chat/constants.dart';
import 'package:chat/widgets/ai_tool.dart';
import 'package:flutter/material.dart';

class AiToolsPage extends StatelessWidget {
  const AiToolsPage({super.key});
  static final String ID = 'AiToolsPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Text(
          'Choos your favourit tool',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: toolsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: AiTool(tool: toolsList[index]),
            );
          },
        ),
      ),
    );
  }
}
