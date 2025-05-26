import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final time = DateFormat('hh:mm a').format(message.timeSent);
    final date = DateFormat('dd MMM yyyy').format(message.timeSent);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Texto
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),

        const SizedBox(height: 5),

        // Imagen si existe
        if (message.imageUrl != null) _ImageBubble(imageUrl: message.imageUrl!),

        const SizedBox(height: 5),

        // Hora + ícono de visto
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
            Text(
              date,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Emma✨ está enviando una imagen'),
          );
        },
      ),
    );
  }
}
