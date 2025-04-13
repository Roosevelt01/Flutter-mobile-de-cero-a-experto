import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

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
            child: Text('Hola Mundo',
                         style: TextStyle(color: Colors.white),
                    ),
          ),
        ),
        const SizedBox(height: 5),

        _ImageBubble(),

        const SizedBox(height: 10),
        //Todo: imagen
      ],
    );
  }
} 



class _ImageBubble extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
  
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      
      child: Image.network(
        'https://yesno.wtf/assets/no/18-1ba72d815ec0e2bff8dba8699a50e275.gif',        
        width: size.width * 0.7,     
        height: 150,                 
        fit: BoxFit.cover,           
        
        // Paso 1: Implementación del loadingBuilder
        loadingBuilder: (context, child, loadingProgress) {
          // Comentado temporalmente para mostrar siempre el placeholder
          // if(loadingProgress == null) return child;

          // Paso 2: Widget de placeholder durante carga
          return Container(
            width: size.width * 0.7,  // Mismo ancho que la imagen
            height: 150,               // Misma altura que la imagen
            padding: const EdgeInsets.symmetric(
              horizontal: 10,  // Padding horizontal
              vertical: 5,      // Padding vertical
            ),
            child: const Text(
               width:size.width * 0.7,
               height: 150,
               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
               child: const Text('Alejandro está enviando una imagen',),
            ),
          );
        },
      ), 
    );
  }
}