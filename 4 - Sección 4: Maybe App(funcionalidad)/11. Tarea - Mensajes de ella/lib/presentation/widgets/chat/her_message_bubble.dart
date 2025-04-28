import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;  // Paso 1: Declaramos la propiedad que almacenará el mensaje
  
  const HerMessageBubble({
    super.key,
    required this.message,// Paso 2: Constructor que recibe el mensaje como parámetro requerido
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,// Paso 3: Mostramos el texto del mensaje
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),

        // Paso 7: Widget que muestra la imagen del mensaje
        // Usamos ! porque sabemos que los mensajes de "ella" siempre tienen imagen
        _ImageBubble(message.imageUrl!),

        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;// Paso 4: Propiedad que almacena la URL de la imagen
  
  const _ImageBubble(this.imageUrl);// Paso 5: Constructor que recibe la URL de la imagen

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,// Paso 6: Usamos la URL de la imagen
        width: size.width * 0.7,     
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Alejandro está enviando una imagen'),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: size.width * 0.7,
            height: 150,
            color: Colors.grey[300],
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 40),
                SizedBox(height: 8),
                Text('Error al cargar imagen'),
              ],
            ),
          );
        },
      ), 
    );
  }
}

