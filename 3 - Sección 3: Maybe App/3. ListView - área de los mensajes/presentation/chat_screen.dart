import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Estructura básica de la pantalla
      appBar: AppBar( // Barra de aplicación en la parte superior
        leading: const Padding( // Espacio antes del título
          padding: EdgeInsets.all(4.0), // Agregamos padding al CircleAvatar
          child: CircleAvatar( // Avatar circular con la imagen de perfil
            backgroundImage: NetworkImage( // Carga la imagen desde la web
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzyDzGUOkGUhw1tLvonMzkSk4XSa4f4aVtmEo6fyKOSoKE4jFiUH0V5MeY_B2RZRCMuPI&usqp=CAU'),
          ),
        ),
        title: const Text('Alejandro'), // Título del AppBar
        centerTitle: false, // Alinea el título a la izquierda
      ),
    );
  }
}