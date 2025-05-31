import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  // Paso 2: Definición del nombre estático de la ruta para ButtonsScreen
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const Placeholder(),
    );
  }
}