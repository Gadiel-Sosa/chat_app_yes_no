import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:flutter/material.dart';
//* Send message

class ChatProvider extends ChangeNotifier {
  //Controlador quemaneja la posición del scroll
  final ScrollController chatScrollController = ScrollController();
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
    Message(text: "Me", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    // Asincrono (no al mismo tiempo)
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    messageList.add(newMessage);
    // ignore: avoid_print
    print(
        'Cantidad de mensajes: ${messageList.length}'); // Si no hay mensaje no hace nada
    notifyListeners(); // Notifica al provider que hay un cambio
    moveScrollToBottom();
    // Mueve el scroll al final de la lista
  }

  //mover el scroll al final de la lista
  Future<void> moveScrollToBottom() async {
    //animación
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        //posicion del maximo scroll posible
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        //Rebote al final de la animación
        curve: Curves.easeOut);
  }
}
