import 'package:tiktok/domain/entities/video_post.dart'; // Importa la entidad VideoPost del dominio.

class LocalVideoModel {
  final String name; // Corresponde a la clave 'name' en nuestro Map de datos local.
  final String videoUrl; // Corresponde a la clave 'videoUrl'.
  final int likes; // Corresponde a la clave 'likes'.
  final int views; // Corresponde a la clave 'views'.

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
    name: json['name'], // Asigna el valor de 'name' del JSON al atributo 'name' del modelo.
    videoUrl: json['videoUrl'], // Asigna el valor de 'videoUrl' del JSON al atributo 'videoUrl'.
    likes: json['likes'] ?? 0, // Asigna el valor de 'likes' del JSON al atributo 'likes', o 0 si es nulo.
    views: json['views'] ?? 0, // Asigna el valor de 'views' del JSON al atributo 'views', o 0 si es nulo.
  );

  VideoPost toEntity() => VideoPost(
    caption: name, // Mapea el 'name' del modelo al 'caption' de la entidad VideoPost.
    videoUrl: videoUrl, // Mapea el 'videoUrl' del modelo al 'videoUrl' de la entidad.
    likes: likes, // Mapea los 'likes' del modelo a los 'likes' de la entidad.
    views: views, // Mapea las 'views' del modelo a las 'views' de la entidad.
  );
}