

// Importa la interfaz del datasource desde el dominio
import 'package:tiktok/domain/datasource/video_post_datasource.dart';
// Importa la entidad VideoPost del dominio
import 'package:tiktok/domain/entities/video_post.dart';
// Importa la interfaz del repositorio desde el dominio
import 'package:tiktok/domain/repositories/video_pots_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  // Datasource inyectado como dependencia
  final VideoPostsDatasource videoPostsDatasource;

  // Constructor que requiere un VideoPostsDatasource concreto
  VideoPostsRepository({
    required this.videoPostsDatasource  // Inyección de dependencia obligatoria
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();  // Lanza excepción si se intenta usar
  }

}