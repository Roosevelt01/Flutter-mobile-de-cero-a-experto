

/// Clase que representa un video dentro de la aplicación.
class VideoPost {
  /// Descripción o título del video.
  final String caption;

  /// Ruta o URL del archivo de video.
  final String videoUrl;

  /// Número de "me gusta" que ha recibido el video.
  final int likes;

  /// Número de visualizaciones del video.
  final int views;

  /// Constructor que inicializa una instancia de [VideoPost].
  /// 
  /// [caption] y [videoUrl] son obligatorios.
  /// [likes] y [views] tienen valores por defecto de 0.
  VideoPost({
    required this.caption,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });
}