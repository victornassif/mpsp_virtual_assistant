import 'package:uuid/uuid.dart';

class MessageModel {
  String uuid = Uuid().v1();
  String msg;
  String owner;
  bool writing;

  MessageModel(
      {this.msg, this.owner, this.writing});
}
