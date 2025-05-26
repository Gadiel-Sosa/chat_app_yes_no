import 'package:chat_app_yes_no/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );
  Message toMessageEntity() => Message(
        text: answer == 'yes'
            ? 'claro'
            : answer == 'yes'
                ? 'Obvio'
                : 'Ya sabes',
        fromWho: FromWho.hers,
        imageUrl: image,
        timeSent: DateTime.now(),
      );
}
