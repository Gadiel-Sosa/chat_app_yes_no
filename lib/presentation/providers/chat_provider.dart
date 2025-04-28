import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:flutter/material.dart';
//* Send message

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(
      text: "Hola",
      fromWho: FromWho.hers,
    ),
    Message(
      text: "Mundo",
      fromWho: FromWho.me,
    ),
    Message(text: "Oxxo", fromWho: FromWho.hers),
    Message(text: "Oxxo", fromWho: FromWho.hers),
    Message(text: "Oxxo", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    // Asincrono (no al mismo tiempo)
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners(); // Notifica a los widgets que están escuchando
  }
}
