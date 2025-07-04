import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/helpers/human_formarts.dart'; // Importa la clase HumanFormats.

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [      
        _CustomIconButton(value: video.likes, iconColor: Colors.red, iconData: Icons.favorite),
        _CustomIconButton(value: video.views, iconData: Icons.remove_red_eye_outlined),
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

        // Utiliza la clase HumanFormats para formatear el valor numérico.
        Text(HumanFormats.humanreadbleNumber(value.toDouble())),
      ],
    );
  }
}