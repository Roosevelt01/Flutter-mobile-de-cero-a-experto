
import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

// Clase 'ChatProvider' que extiende de 'ChangeNotifier'.
// 'ChangeNotifier' es parte del framework de Flutter y proporciona
// una forma sencilla de notificar a los listeners sobre cambios en el estado.
class ChatProvider extends ChangeNotifier {
  // Lista privada para almacenar los mensajes del chat.
  List<Message> _messages = [
    // Mensaje inicial 1: Texto "Hola amor", enviado por el usuario actual ('FromWho.me').
    Message(text: 'Hola amor', fromWho: FromWho.me),
    // Mensaje inicial 2: Texto "Hola amor", enviado por el usuario actual ('FromWho.me').
    Message(text: 'Hola amor', fromWho: FromWho.me),
  ];

  // Getter público para acceder a la lista de mensajes.
  // Al ser un getter, se accede a '_messages' como si fuera una propiedad normal
  // pero permite encapsular la lógica de acceso si fuera necesario.
  List<Message> get messages => _messages;

  // Método asíncrono para enviar un nuevo mensaje.
  // 'Future<void>' indica que este método realizará una operación asíncrona
  // y no devolverá ningún valor cuando se complete.
  Future<void> sendMessage(String text) async {
    // TODO: Implementar la lógica para enviar un mensaje.
  }
}