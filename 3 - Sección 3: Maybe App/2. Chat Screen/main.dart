import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/app_theme.dart'; // Importa el tema personalizado de la aplicación
import 'package:yes_no_app/presentation/chat/chat_screen.dart'; // Importa la pantalla de chat

void main() => runApp(const MyApp()); // Punto de entrada de la aplicación

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Yes No App', 
      debugShowCheckedModeBanner: false, 
      theme: AppTheme(selectedColor: 4).theme(), 
      home: const ChatScreen(), // Establece ChatScreen como la pantalla principal
    );
  }
}