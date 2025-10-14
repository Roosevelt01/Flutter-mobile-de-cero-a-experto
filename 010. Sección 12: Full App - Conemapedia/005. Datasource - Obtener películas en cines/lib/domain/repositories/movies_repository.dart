import 'package:cinemapedia/domain/entities/movie.dart';

/// Paso 1: Define el Repositorio para la obtención y manejo de datos de películas.
/// Este es un contrato abstracto que el resto de la aplicación utilizará
/// para interactuar con los datos de las películas, sin conocer la fuente de datos subyacente.
abstract class MoviesRepository {
  /// Paso 1.1: Obtiene una lista de películas que están actualmente en cartelera.
  Future<List<Movie>> getNowPlaying({int page = 1});
}