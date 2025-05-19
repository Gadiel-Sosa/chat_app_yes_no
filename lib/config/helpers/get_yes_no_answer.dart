import 'package:chat_app_yes_no/domain/entities/message.dart';
import 'package:chat_app_yes_no/infrastructure/models/yes_no_models.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  //* Instancia para de la clase DIO para manejar peticiones HTTP
  //* Para la comunicación
  final _dio = Dio();

  Future<Message> getAnswer() async {
    //Almacenar la peticiión
    final response = await _dio.get('https://yesno.wtf/api');
    //* Almacenar los datos de la respuesta
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
