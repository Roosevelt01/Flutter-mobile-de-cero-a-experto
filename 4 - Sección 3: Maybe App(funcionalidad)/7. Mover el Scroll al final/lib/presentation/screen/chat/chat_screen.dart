// Archivo: lib/presentation/screens/chat/chat_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzyDzGUOkGUhw1tLvonMzkSk4XSa4f4aVtmEo6fyKOSoKE4jFiUH0V5MeY_B2RZRCMuPI&usqp=CAU'),
          ),
        ),
        title: const Text('Alejandro'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,/*Paso 3: Asignar el ScrollController al ListView*/
                itemCount: chatProvider.messages.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  return (message.fromWho == FromWho.hers)
                      ? const HerMessageBubble()
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}