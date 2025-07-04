import 'package:flutter/material.dart';
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

        // GestureDetector para detectar el gesto de doble toque
        return GestureDetector(
          onTap: (){ // Al hacer doble toque, se pausa o reproduce el video
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