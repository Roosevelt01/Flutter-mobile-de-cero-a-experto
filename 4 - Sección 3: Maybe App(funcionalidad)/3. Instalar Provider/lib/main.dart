// Archivo: lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // <- Importación del paquete Provider
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart'; // <- Importación del ChatProvider

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*Paso 1: Envolver MaterialApp con MultiProvider*/
    return MultiProvider(
      providers: [
        /*Paso 2: Crear e instanciar el ChatProvider*/
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        // Aquí se pueden añadir más Providers en el futuro
      ],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 4).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}