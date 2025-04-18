// Archivo: lib/presentation/providers/chat_provider.dart
import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {  
  final ScrollController chatScrollController = ScrollController();/*Paso 1: Crear una instancia de ScrollController*/

  List<Message> messages = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya llegaste del trabajo?', fromWho: FromWho.me),
  ];
  
  Future<void> sendMessage(String text) async {/*Paso 4: Método para enviar un nuevo mensaje y mover el scroll al final*/
    await (Future.delayed(const Duration(milliseconds: 100))); /*Paso 5: Simular un pequeño delay para la sensación de envío*/
    
    if (text.isEmpty) return;/*Paso 6: Evitar enviar mensajes vacíos*/

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);
    notifyListeners();
    /*Paso 7: Llamar al método para mover el scroll al final*/
    moveScrollToBottom();
  }

  /*Paso 3: Método para animar el Scroll al final de la lista*/
  void moveScrollToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
