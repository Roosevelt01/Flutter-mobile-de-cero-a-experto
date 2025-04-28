import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
   final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    
    // Paso 7: Crear instancia del modelo a partir del JSON recibido
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    // Paso 8: Mapear el modelo a la entidad Message
    return Message(
      text: yesNoModel.answer,
      fromWho: FromWho.hers,
      imageUrl: yesNoModel.image,
    );
  }
}