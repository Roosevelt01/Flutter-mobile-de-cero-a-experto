import 'package:animate_do/animate_do.dart'; // Importa el paquete animate_do.
import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/helpers/human_formarts.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(value: video.likes, iconColor: Colors.red, iconData: Icons.favorite),
        const SizedBox(height: 20), // Agrega un espacio vertical entre los botones.
        _CustomIconButton(value: video.views, iconData: Icons.remove_red_eye_outlined),
        const SizedBox(height: 20), // Agrega otro espacio vertical.
        
        // Agrega el widget SpinPerfect para la animación del ícono.
        SpinPerfect(
          // Hace que la animación se repita indefinidamente.
          infinite: true, 
          duration: const Duration(seconds: 5), // Define la duración de una rotación completa en 5 segundos.
          // Crea el botón con el ícono de reproducción.
          child: const _CustomIconButton(value:0, iconData: Icons.play_circle_outline), 
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor,
  }): color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon:Icon(iconData, color: color, size: 30,)
        ),

        if(value > 0) // Condición para mostrar el texto solo si el valor es mayor que 0.
        Text(HumanFormats.humanreadbleNumber(value.toDouble())),
      ],
    );
  }
}