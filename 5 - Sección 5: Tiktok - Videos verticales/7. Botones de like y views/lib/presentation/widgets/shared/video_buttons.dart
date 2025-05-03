import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video; // Objeto VideoPost que contiene datos del video actual

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Botón personalizado para mostrar número de "likes" con icono de corazón rojo
        _CustomIconButton(value: video.likes,iconColor: Colors.red, iconData: Icons.favorite,),
        // Botón personalizado para mostrar número de "views" con icono de ojo
        _CustomIconButton(value: video.views, iconData: Icons.remove_red_eye_outlined,),
      ],
    );
  }
}

// Widget privado reutilizable para botones de acción con icono + contador
class _CustomIconButton extends StatelessWidget {
  final int value;         // Valor numérico a mostrar (likes, views, etc.)
  final IconData iconData; // Icono a mostrar (heart, eye, etc.)
  final Color? color;     // Color del icono (opcional, default blanco)

  // Constructor con parámetros nombrados
  const _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor,  // Parámetro opcional sin 'required'
  }): color = iconColor ?? Colors.white;  // Asignación condicional de color

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,  // Ocupa solo espacio necesario
      children: [
        // Botón interactivo con icono
        IconButton(
          onPressed: () {},  // TODO: Implementar acción al presionar
          icon: Icon(iconData,color: color,size: 30,     
          ),
        ),
        
        // Texto con el valor numérico
        Text('$value', style: TextStyle(color: color, fontSize: 12,),
        ),
      ],
    );
  }
}