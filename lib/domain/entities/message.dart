// Identidad atómica la unidad más pequeña de la aplicación
enum FromWho {
  me,
  hers,
}

//* Identidad atómica
class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime timeSent;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
    required this.timeSent,
  });
}
