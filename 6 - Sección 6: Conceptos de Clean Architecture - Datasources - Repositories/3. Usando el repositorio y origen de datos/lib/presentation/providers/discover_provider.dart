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

  Future<void> loadNextPage() async {
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
