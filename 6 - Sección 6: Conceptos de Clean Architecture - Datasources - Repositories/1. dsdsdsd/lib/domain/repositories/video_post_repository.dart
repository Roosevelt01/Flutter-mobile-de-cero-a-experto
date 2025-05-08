// Paso 2: Clase abstracta que define la interfaz del repositorio
abstract class VideoPostsRepository {
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
