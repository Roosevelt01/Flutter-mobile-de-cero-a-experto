import 'package:flutter/material.dart'; // Importa la librería principal de Flutter.
import 'package:toktik/config/theme/app_theme.dart'; // Importa la definición de nuestro tema personalizado.

void main() => runApp(const MyApp()); // Función principal que inicia la aplicación.

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor del widget MyApp.

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Widget raíz de la aplicación que sigue las guías de Material Design.
      title: 'TokTik', // Título de la aplicación.
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de depuración en modo desarrollo.
      theme: AppTheme().getTheme(), // Aplica el tema personalizado definido en AppTheme.
      home: Scaffold( // Estructura básica de una pantalla con AppBar y Body.
        appBar: AppBar( // Barra superior de la pantalla.
          title: const Text('TokTik App Bar'), // Título de la AppBar.
        ),
        body: const Center( // Centra su widget hijo.
          child: Text('Pantalla Inicial'), // Texto que se muestra en el centro de la pantalla.
        ),
      ),
    );
  }
}