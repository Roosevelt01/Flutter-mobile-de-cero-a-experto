// Dame una explicación de la línea de código que tienen comentarios, me gustaría saber el flujo de ejecución de gesture  y agregale comentario solo los que tienen comentarios

import 'package:flutter/material.dart';
import 'package:tiktok/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullscreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullscreenPlayer({
    super.key,
    required this.videoUrl, 
    required this.caption
  });

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        
        if(snapshot.connectionState != ConnectionState.done){
            return const Center(child: CircularProgressIndicator(strokeWidth:2));
        }

        return GestureDetector(
          onTap: (){ 
            if(controller.value.isPlaying) {
            controller.pause();
            return;
            } 
            controller.play();
          },


          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),
            
              //Paso 2
                VideoBackground(
                  stops: const [0.0, 1.0],
                ),

                Positioned(
                  bottom: 20,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption, ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

 
class _VideoCaption extends StatelessWidget {
  final String caption;
  
  const _VideoCaption({
    super.key,
    required this.caption,
  });
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle),      
    );
  }
}