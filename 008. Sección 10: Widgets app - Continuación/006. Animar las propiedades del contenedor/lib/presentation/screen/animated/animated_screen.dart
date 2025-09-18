import 'package:flutter/material.dart';

//Paso 1: Construcción de la Interfaz y Animación
class AnimatedScreen extends StatelessWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container Screen')),

      floatingActionButton: FloatingActionButton(
        onPressed: () { },// Aún sin funcionalidad
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}

//Paso 2: Añadir un Container Estático
class AnimatedScreen extends StatelessWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container Screen')),

      // Se añade un Container regular y estático en el centro de la pantalla para
      //tener un punto de partida visual.
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}

//Paso 3: Paso 3: Introducir AnimatedContainer(Código final)
class AnimatedScreen extends StatelessWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container Screen')),

    
      body: Center(
        // Reemplazamos el Container estático por un AnimatedContainer
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          width: 300, // Nuevos valores para ver la animación al cargar
          height: 230,
          decoration: BoxDecoration(
            color: Colors.red,// Nuevo color
            borderRadius: BorderRadius.circular(10), // Nuevo radio
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}