

import 'package:flutter/material.dart';

/// Pantalla principal para descubrir y explorar videos
/// Muestra una lista de videos en formato scrollable vertical
/// Actualmente muestra un placeholder hasta implementar la lógica completa
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold proporciona la estructura básica de material design
    return const Scaffold(
      // Body ocupa toda el área disponible
      body: Center(
        // Widget temporal hasta implementar la lista de videos
        child: Text(
          'DiscoverScreen', 
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}