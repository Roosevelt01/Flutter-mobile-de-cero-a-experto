import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos,});

  @override
  Widget build(BuildContext context) {
    return PageView.builder( // Construye páginas bajo demanda para optimizar rendimiento
      scrollDirection: Axis.vertical, 
      physics: const BouncingScrollPhysics(), 
      itemCount: videos.length, // Número total de páginas igual a la cantidad de videos
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index]; // Obtener video actual por índice

        return Stack( // Superponer widgets (video y botones)
          children: [
            // Aquí se puede agregar el widget reproductor de video

            Positioned( // Posicionar botones en esquina inferior derecha
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost), // Botones de interacción para el video
            ),
          ],
        );
      },
    );
  }
}