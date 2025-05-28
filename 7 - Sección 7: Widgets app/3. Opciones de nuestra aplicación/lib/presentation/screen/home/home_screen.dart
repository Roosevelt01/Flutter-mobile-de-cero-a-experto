import 'package:flutter/material.dart';

// Paso 2: Define la estructura de la pantalla de inicio como un widget sin estado.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      )// Fin de AppBar
    ); // Fin de Scaffold
  }
}