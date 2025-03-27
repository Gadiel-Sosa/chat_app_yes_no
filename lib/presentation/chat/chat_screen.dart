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
    );
  }
}

// Terminé el video 3 continuar en el 4
