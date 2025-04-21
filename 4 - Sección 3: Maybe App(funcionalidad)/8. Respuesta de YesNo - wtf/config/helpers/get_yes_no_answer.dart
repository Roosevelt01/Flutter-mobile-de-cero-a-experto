import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNoAnswer {
  final _dio = Dio(); // Paso 2: Instancia de Dio

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api'); // Paso 3: Petición GET
    throw UnimplementedError(); // Paso 4: Placeholder para implementación futura
  }
}