
// my_message_bubble.dart - Widget personalizado para mensajes del usuario
import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene el esquema de colores del tema actual
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // Alinea a la derecha
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary, // Usa el color primario del tema
            borderRadius: BorderRadius.circular(20) // Bordes redondeados
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20, 
              vertical: 10
            ),
            child: Text(
              'Laboris duis dolore', 
              style: TextStyle(color: Colors.white), // Texto blanco
            ),
          ),
        ),
        const SizedBox(height: 10), // Espaciado entre burbujas
      ],
    );
  }
}