import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/insfrastructure/models/local_video_model.dart';
import 'package:tiktok/shared/data/local_video_posts.dart'; // Importa la lista de datos locales

class DiscoverProvider extends ChangeNotifier{
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {    
    // Simula una carga asíncrona de datos
    await Future.delayed(const Duration(seconds: 2)); 

    //(Recien agregado en esa clase)
    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJson(video).toEntity()
      ).toList();

    // Transformación de datos en 3 pasos:
    // 1. videoPosts (JSON) → LocalVideoModel (fromJson)
    // 2. LocalVideoModel → VideoPost (toEntity)
    // 3. Iterable → List (toList)
    final List<VideoPost> newVideos = videoPosts
      .map((videoJson) => LocalVideoModel.fromJson(videoJson).toEntity())
      .toList(); 

    // Actualización del estado
    videos.addAll(newVideos);  // Agrega nuevos videos a la lista existente
    initialLoading = false;    // Indica que terminó la carga inicial  


    notifyListeners();
  }
  
}