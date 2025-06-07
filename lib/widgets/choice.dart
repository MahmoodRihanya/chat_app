import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Choice extends StatelessWidget {
  Choice({
    required this.text,
    required this.backgroundColor,
    required this.textAndShadowColor,
    required this.onTap,
  });
  String text;
  Color backgroundColor, textAndShadowColor;
  GestureCancelCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: textAndShadowColor, fontSize: 50),
        ),
        height: 200,
        width: 200,

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: textAndShadowColor,
              blurRadius: 12,
              spreadRadius: 12,
            ),
          ],
          color: backgroundColor,
          border: Border.all(color: Colors.white, width: 8),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
