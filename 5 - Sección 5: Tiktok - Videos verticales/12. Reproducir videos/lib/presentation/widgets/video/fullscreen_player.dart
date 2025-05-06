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
        
        // Mostrar loader mientras el video se inicializa 
        if(snapshot.connectionState != ConnectionState.done){
            return const Center(child: CircularProgressIndicator(strokeWidth:2));
        }

        // Mostrar video con aspecto correcto y superposición
        return AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: Stack(
            children: [
              // Widget que reproduce el video 
              VideoPlayer(controller),

              // Caption posicionado sobre el video 
              Positioned(
                bottom: 20,
                left: 20,
                child: _VideoCaption(caption: widget.caption, ),
              ),               
            ],
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