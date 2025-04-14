// Archivo: lib/presentation/providers/chat_provider.dart

import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya llegaste del trabajo?', fromWho: FromWho.me),
  ];

  /*Paso 1: Método para enviar un nuevo mensaje*/
  Future<void> sendMessage(String text) async {
    /*Paso 2: Crear una nueva instancia de Message para el usuario actual*/
    final newMessage = Message(text: text, fromWho: FromWho.me);
    /*Paso 3: Añadir el nuevo mensaje a la lista de mensajes*/
    messages.add(newMessage);
    /*Paso 4: Notificar a los listeners (widgets que están escuchando este Provider) sobre el cambio de estado*/
    notifyListeners();
  }
}