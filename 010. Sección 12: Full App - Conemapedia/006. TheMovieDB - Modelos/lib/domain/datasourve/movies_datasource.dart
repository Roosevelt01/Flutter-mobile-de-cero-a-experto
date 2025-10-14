import 'package:cinemapedia/domain/entities/movie.dart';

/// Paso 1: Define el origen de datos abstracto para las películas.
/// Esta clase define los métodos que cualquier fuente de datos de películas (ya sea una API, una base de datos local, etc.) debe implementar.
abstract class MoviesDatasource {
  /// Paso 1.1: Obtiene una lista de películas que están actualmente en cartelera.
  /// Recibe un número de página para la paginación de resultados.
  Future<List<Movie>> getNowPlaying({int page = 1});
}