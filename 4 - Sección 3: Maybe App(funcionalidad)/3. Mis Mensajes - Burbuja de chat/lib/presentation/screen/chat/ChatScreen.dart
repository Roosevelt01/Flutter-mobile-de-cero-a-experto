// chat_screen.dart - Pantalla principal del chat
import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/my_message_bubble.dart';

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
              'https://example.com/avatar.jpg'), 
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10), 
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100, 
                itemBuilder: (context, index) {
                  return const MyMessageBubble(); // Usa nuestro widget personalizado
                },
              ),
            ),
            Text("Hola Mundo") 
          ],
        ),
      ),
    );
  }
}