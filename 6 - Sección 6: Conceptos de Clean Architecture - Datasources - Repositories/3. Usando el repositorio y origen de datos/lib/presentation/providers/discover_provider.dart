import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/domain/repositories/video_pots_repository.dart';
import 'package:tiktok/insfrastructure/models/local_video_model.dart';
import 'package:tiktok/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  // Paso 1: Declaración del repositorio que proveerá los videos
  final VideoPostRepository videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  // Paso 2: Constructor que recibe el repositorio como dependencia
  DiscoverProvider({
    required this.videosRepository,
  });

  Future<void> loadNextPage() async {
    // Paso 3: Solicitar al repositorio los videos de la página 1
    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
