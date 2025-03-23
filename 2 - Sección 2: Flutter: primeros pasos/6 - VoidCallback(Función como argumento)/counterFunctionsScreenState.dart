import 'package:flutter/material.dart';

// Clase que representa la pantalla del contador
class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  // Método que crea el estado asociado al widget
  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

// Clase que maneja el estado del widget
class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  // Variable que almacena el número de clics
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior de la pantalla
      appBar: AppBar(
        title: const Text('Counter Function Screen'),
        // Acciones en la AppBar (lado derecho)
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              // Reinicia el contador a cero
              setState(() {
                clickCounter = 0;
              });
            },
          ),
        ],
      ),
      // Cuerpo de la pantalla
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Texto que muestra el número de clics
            Text(
              '$clickCounter',
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.w200,
              ),
            ),
            // Texto que muestra "Click" o "Clicks" según el número de clics
            Text(
              'Click${clickCounter > 1 ? 's' : ''}',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      // Botones flotantes en columna vertical
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Botón de reinicio
          CustomBotton(
            icon: Icons.refresh_rounded,
            onPressed: () {
              // Reinicia el contador a cero
              clickCounter = 0;
              setState(() {}); // Notifica a Flutter para actualizar la UI
            },
          ),
          const SizedBox(height: 10), // Espaciador entre botones

          // Botón de decremento
          CustomBotton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () {
              // Decrementa el contador si es mayor que cero
              if (clickCounter == 0) return; // No decrementa si es cero
              clickCounter--;
              setState(() {}); // Notifica a Flutter para actualizar la UI
            },
          ),
          const SizedBox(height: 10), // Espaciador entre botones

          // Botón de incremento
          CustomBotton(
            icon: Icons.plus_one,
            onPressed: () {
              // Incrementa el contador
              clickCounter++;
              setState(() {}); // Notifica a Flutter para actualizar la UI
            },
          ),
        ],
      ),
    );
  }
}

// Clase que representa un botón personalizado
class CustomBotton extends StatelessWidget {
  // Icono que se mostrará en el botón
  final IconData icon;
  // Acción que se ejecuta al presionar el botón (opcional)
  final VoidCallback? onPressed;

  // Constructor que recibe el icono y la acción
  const CustomBotton({
    super.key, 
    required this.icon, 
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // Activa el feedback táctil (vibración o sonido)
      enableFeedback: true,
      // Nivel de elevación del botón (sombra)
      elevation: 5,
      // Color de fondo del botón
      backgroundColor: Colors.amber,
      // Acción que se ejecuta al presionar el botón
      onPressed: onPressed,
      // Icono del botón
      child: Icon(icon),
    );
  }
}
