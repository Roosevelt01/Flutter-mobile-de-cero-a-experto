import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  // Paso 3: Definición del nombre estático de la ruta para CardsScreen
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const Placeholder(),
    );
  }
}