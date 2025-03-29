import 'package:chat_app_yes_no/presentation/widgets/chat/her_messages_bubbles.dart';
import 'package:chat_app_yes_no/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? const HerMessageBubble()
                      : const MyMessageBubble();
                },
              ),
            ),
            Text('Hello')
          ],
        ),
      ),
    );
  }
}

// Terminé el video 3 continuar en el 4
