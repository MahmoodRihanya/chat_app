import 'package:flutter/cupertino.dart';

final ScrollController scrollController = ScrollController();
void scrollDown() {
  scrollController.animateTo(
    scrollController.position.maxScrollExtent,
    duration: Duration(seconds: 2),
    curve: Curves.easeIn,
  );
}
