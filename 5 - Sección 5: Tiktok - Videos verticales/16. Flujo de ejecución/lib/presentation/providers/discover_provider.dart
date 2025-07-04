
import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/insfrastructure/models/local_video_model.dart';
import 'package:tiktok/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier{
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    
    //await(Future.delayed(const Duration(seconds: 2))); 

    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJson(video).toEntity()
      ).toList();

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }


}