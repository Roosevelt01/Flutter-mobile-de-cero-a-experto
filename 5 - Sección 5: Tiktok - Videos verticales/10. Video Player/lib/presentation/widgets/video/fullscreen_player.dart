import 'package:flutter/material.dart';

class FullscreenPlayer extends StatelessWidget {
  final String videoUrl;
  final String caption;

  const FullscreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    // Por ahora retorna un Container vacío, se implementará el reproductor luego
    return Container();
  }
}


