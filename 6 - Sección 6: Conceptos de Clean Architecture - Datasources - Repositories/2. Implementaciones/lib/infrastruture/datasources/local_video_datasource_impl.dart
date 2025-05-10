// lib/infrastructure/datasources/local_video_datasource_impl.dart

import 'package:tiktok/domain/datasource/video_post_datasource.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/insfrastructure/models/local_video_model.dart';
import 'package:tiktok/shared/data/local_video_posts.dart'; // Importa los datos locales

// Declara la clase e indica que implementa la interfaz del Dominio
class LocalVideoDatasourceImpl implements VideoPostsDatasource {

  @override
  Future<List<String>> getFavoriteVideosByUser(String userId) {
    // Implementación pendiente (Paso 3)
    throw UnimplementedError(); // Placeholder temporal
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    // Simula un retardo asíncrono de 2 segundos.
    // Esto representa el tiempo que tomaría obtener datos de una fuente externa.
    await Future.delayed(const Duration(seconds: 2));

      // Accede a la lista de datos locales 'videoPosts'
    final List<VideoPost> newVideos = videoPosts.map(
      // Para cada 'video' en la lista 'videoPosts' (que es un mapa):
      // 1. Crea una instancia de LocalVideoModel usando el factory constructor fromJson.
      // 2. Llama al método toEntity() de LocalVideoModel para convertirlo a una entidad VideoPost.
      (video) => LocalVideoModel.fromJson(video).toEntity()
    ).toList(); // Convierte el resultado del map (un Iterable) de nuevo a una List<VideoPost>.

    // Retorna la lista de entidades VideoPost
    return newVideos;
  }
}