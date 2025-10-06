import 'package:flutter/material.dart';

//Paso 1: Crear la Estructura del Archivo y del Widget.
class CounterScreen extends StatelessWidget {
  static const String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(); // Placeholder inicial
  }
}

//Paso 2: Construir la Interfaz de Usuario(Código final)
class CounterScreen extends StatelessWidget {
  
  static const name = 'counter_screen';
  
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child:
         Text(
          "Valor 10", 
          style: Theme.of(context).textTheme.titleLarge,
          ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){}
      ),
    );
  }
}