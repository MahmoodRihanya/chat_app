import 'package:chat/constants.dart';
import 'package:chat/models/ai_tool_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: must_be_immutable
class AiTool extends StatelessWidget {
  AiTool({super.key, required this.tool});
  AiToolModel tool;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launchUrlString(tool.url!);
      },
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          border: Border.all(color: kAiColor, width: 5),
          borderRadius: BorderRadius.circular(30),
        ),
        height: 75,
        width: MediaQuery.sizeOf(context).width - 80,

        child: Row(
          children: [
            CircleAvatar(radius: 35, backgroundImage: AssetImage(tool.image!)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                tool.text!,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            Icon(Icons.label_important),
          ],
        ),
      ),
    );
  }
}
