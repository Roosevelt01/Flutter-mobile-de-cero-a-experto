


import 'package:flutter/material.dart';


import 'package:tiktok/domain/entities/video_post.dart'; // Importación de la entidad VideoPost

/// Provider para gestionar el estado de la pantalla de descubrimiento
/// 
/// Responsable de:
/// - Manejar la carga de videos
/// - Mantener el estado de carga inicial
/// - Notificar cambios a la UI
class DiscoverProvider extends ChangeNotifier {


  bool initialLoading = true;// Indica si es la primera carga de contenido
  
  List<VideoPost> videos = [];// Lista que almacena los videos mostrados

  /// Actualiza el estado y notifica a los listeners cuando completa
  Future<void> loadNextPage() async {

    // Notifica a los widgets suscritos para que se reconstruyan
    notifyListeners();
  }
  
}