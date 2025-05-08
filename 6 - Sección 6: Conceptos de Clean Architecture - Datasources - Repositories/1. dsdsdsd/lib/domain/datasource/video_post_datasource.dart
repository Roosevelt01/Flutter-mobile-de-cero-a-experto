// Paso 1: Clase abstracta que define la interfaz para obtener videos
abstract class VideoPostsDatasource {
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}




