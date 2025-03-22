import 'package:flutter/material.dart';

// 1. Se convierte a StatefulWidget para manejar estado mutable
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  // 2. Se crea el estado asociado
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

// 3. Clase de estado que maneja los datos dinámicos
class _CounterScreenState extends State<CounterScreen> {
  // 4. Variable de estado para almacenar el número de clics
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 5. Se agrega una AppBar para mejorar la interfaz de usuario
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 6. Texto dinámico que muestra el valor actual del contador
            Text('$clickCounter', style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w200)),
            const Text('Clicks', style: TextStyle(fontSize: 25)),
          ],
        ),
      ),
      // 7. Botón flotante que incrementa el contador al ser presionado
      floatingActionButton: FloatingActionButton(
        // 8. Lógica para incrementar el contador y actualizar la UI
        onPressed: () {
          clickCounter++; // Incrementa el valor del contador
          setState(() {}); // Notifica a Flutter que el estado ha cambiado
        },
        child: Icon(Icons.plus_one), // Icono del botón
      ),
    );
  }
}
