import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        _ImageBubble(
          imageUrl: message.imageUrl!,
        ), // Aqui se va a mostrar la imagen

        SizedBox(
          height: 5,
        ),

        // Todo: imagen
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
    // print(size);
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
