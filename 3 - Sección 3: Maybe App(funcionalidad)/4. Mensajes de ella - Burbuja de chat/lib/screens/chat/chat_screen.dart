import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/her_message_bubble.dart';

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
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzyDzGUOkGUhw1tLvonMzkSk4XSa4f4aVtmEo6fyKOSoKE4jFiUH0V5MeY_B2RZRCMuPI&usqp=CAU',
            ),
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
                  // Operador ternario para alternar entre HerMessageBubble y MyMessageBubble
                  return (index % 2 == 0)
                      ? const HerMessageBubble() // Si el índice es par, muestra HerMessageBubble
                      : const MyMessageBubble(); // Si el índice es impar, muestra MyMessageBubble
                },
              ),
            ),
            const Text("Hola Mundo")
          ],
        ),
      ),
    );
  }
}