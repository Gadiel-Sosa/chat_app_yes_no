import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  //* Variable message de la unidad atómica Message
  final Message message;
  //* Se añade la varibale al constructor
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
