
import 'package:flutter/material.dart';

// Paso 1: Definición de la pantalla de botones
class CardsScreen extends StatelessWidget {
  // Constructor constante para una inicialización eficiente
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(// Widget fundamental de Material Design para una estructura de pantalla
      appBar: AppBar(// Barra superior de la aplicación
        title: const Text('Cards Screen'),// Título de la AppBar
      ),
      body: const Placeholder(),
    );
  }
}