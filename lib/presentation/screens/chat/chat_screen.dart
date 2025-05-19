import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:chat_app_yes_no/presentation/providers/chat_provider.dart';
import 'package:chat_app_yes_no/presentation/widgets/chat/her_messages_bubbles.dart';
import 'package:chat_app_yes_no/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chat_app_yes_no/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx1bNUUz_1tMH69FisHpqEUVOdmvjMgQY5Yg&s'),
          ),
        ),
        title: Text('Emma ✨'),
        centerTitle: false,
      ),
      //*CONTINUACION VIDEO 4
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //*pedir que esté pendiente de cambios
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                //enlaza e controlador creado en el provider
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,

                itemBuilder: (context, index) {
                  //* Instancia que sabrá de quien es el mensaje
                  final message = chatProvider.messageList[index];
                  //* Si el residuo es 0 es de ella y si no es 0 es mio
                  //* Si es par es de ella si no es mio
                  //return (index % 2 == 0)
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(
                          message: message,
                        )
                      : MyMessageBubble(
                          message: message,
                        );
                },
              ),
            ),
            //* CAJA DE TEXTO DE MENSAJES
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}

// Terminé el video 3 continuar en el 4
