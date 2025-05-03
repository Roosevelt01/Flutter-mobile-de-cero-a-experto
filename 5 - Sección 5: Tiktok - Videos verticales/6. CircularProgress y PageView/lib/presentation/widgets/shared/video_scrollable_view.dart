import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos,
  });
 
  @override
  Widget build(BuildContext context) {
    return PageView(
      // Especifica que el desplazamiento del PageView será vertical.
      scrollDirection: Axis.vertical, 
      // Aplica un efecto de rebote cuando se alcanza el inicio o el final del desplazamiento.
      physics: const BouncingScrollPhysics(), 
      children: [ // Define la lista de widgets que se mostrarán como "páginas" en el PageView.
        Container(color: Colors.red),
        Container(color: Colors.blueAccent),
        Container(color: Colors.teal),
        Container(color: Colors.yellow),
        Container(color: Colors.pink),
        Container(color: Colors.deepPurple),
      ],
    );
  }
}