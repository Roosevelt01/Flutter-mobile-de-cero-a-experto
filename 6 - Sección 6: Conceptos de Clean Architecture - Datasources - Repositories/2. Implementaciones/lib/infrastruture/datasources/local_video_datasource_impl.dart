

import 'package:tiktok/domain/datasource/video_post_datasource.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/insfrastructure/models/local_video_model.dart';
import 'package:tiktok/shared/data/local_video_posts.dart';

//Se declara una nueva clase llamada LocalVideoDatasourceImpl
class LocalVideoDatasourceImpl implements VideoPostsDatasource {

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) { 
    // Método no implementado en esta versión
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    // Simulación de delay de red/operación asíncrona
    await Future.delayed(const Duration(seconds: 2));
  }

}
