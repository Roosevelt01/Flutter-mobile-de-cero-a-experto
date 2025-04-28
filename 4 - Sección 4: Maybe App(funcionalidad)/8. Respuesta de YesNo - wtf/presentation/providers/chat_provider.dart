import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final  chatScrollController = ScrollController(); //Paso 4 No corresponde a la clase(Es opcional)
  final getYesNoAnswer = GetYesNoAnswer();// Paso 5: Instancia del helper

  List<Message> messagesList = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya llegaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    await(Future.delayed(const Duration(milliseconds:100)));

    if(text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    if(text.endsWith('?')) {// Paso 8: Detectar preguntas
      herReply();// Paso 9: Llamar a la respuesta automática
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {// Paso 6: Método para respuesta automática
    final herMessage = await getYesNoAnswer.getAnswer();// Paso 7: Obtener respuesta

    // (Implementación pendiente para agregar el mensaje a la lista)
  }

  void moveScrollToBottom() {
      chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
  


