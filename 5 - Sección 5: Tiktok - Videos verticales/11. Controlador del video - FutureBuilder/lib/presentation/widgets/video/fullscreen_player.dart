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
  //Declaración tardía del controlador 
  late VideoPlayerController controller;
  
  @override
  void initState() {
    super.initState();

    // Inicialización del controlador de video
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)           // El video se reproduce sin sonido
      ..setLooping(true)       // El video se reproduce en bucle
      ..play();                // El video comienza a reproducirse automáticamente
  }

  @override
  void dispose() {
    controller.dispose(); // Liberar los recursos del controlador al destruir el widget
    super.dispose();
  }  

  @override
  Widget build(BuildContext context) {
    // Uso de FutureBuilder para esperar la inicialización
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        return const Center(child: CircularProgressIndicator(strokeWidth:2));
      },
    );
  }
}