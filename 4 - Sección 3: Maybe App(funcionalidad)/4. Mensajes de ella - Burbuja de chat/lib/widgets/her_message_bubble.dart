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
            color: colors.secondary, //Utiliza el color secundario del tema
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Mundo', //Texto del mensaje
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),

        _ImageBubble(), //Widget para mostrar la imagen

        const SizedBox(height: 10),
        // Todo: imagen
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Aplica bordes redondeados a la imagen
      child: Image.network(
        'https://yesno.wtf/assets/no/18-1ba72d815ec0e2bff8dba8699a50e275.gif', // Paso 10: Carga la imagen desde la URL
        width: size.width * 0.7, //Ancho de la imagen (70% del ancho de la pantalla)
        height: 150, //Alto fijo de la imagen
        fit: BoxFit.cover, //Ajusta la imagen para cubrir el espacio disponible
      ),
    );
  }
}