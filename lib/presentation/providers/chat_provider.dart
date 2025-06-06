import 'package:chat_app_yes_no/config/helpers/get_yes_no_answer.dart';
import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:flutter/material.dart';
//* Send message

class ChatProvider extends ChangeNotifier {
  //Controlador quemaneja la posición del scroll
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    // Asincrono (no al mismo tiempo)
    final newMessage = Message(
      text: text.trim(),
      fromWho: FromWho.me,
      timeSent: DateTime.now(),
    );
    messageList.add(newMessage);
    //* Detectar si el usuario hizo una pregunta
    //* Si el mensaje termina en ? se manda la respuesta
    if (text.endsWith('?')) {
      herReplay();
    }
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

  //* Crear la respuesta de la otra persona
  Future<void> herReplay() async {
    //* Obtener el mensaje de la petición
    final herMessage = await getYesNoAnswer.getAnswer();
    //* Añadir el mensaje a la lista de mensajes
    messageList.add(herMessage);
    //* Notificar al provider que hay un cambio
    notifyListeners();
    //* Mover el scroll al final de la lista
    moveScrollToBottom();
  }
}
