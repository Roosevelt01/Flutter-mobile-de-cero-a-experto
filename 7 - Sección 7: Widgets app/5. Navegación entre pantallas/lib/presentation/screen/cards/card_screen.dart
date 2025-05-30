
import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {// Renombramos la clase a CardsScreen
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),// Cambiamos el título
      ),//Appbar
      body: const Placeholder(),
    );//Scafold
  }
}