import 'package:chat/constants.dart';

class MessageModel {
  final String message;
  final String id;
  MessageModel(this.message, this.id) {}
  factory MessageModel.fromjson(jsondata) {
    return MessageModel(jsondata[kmessage], jsondata[kid]);
  }
}
