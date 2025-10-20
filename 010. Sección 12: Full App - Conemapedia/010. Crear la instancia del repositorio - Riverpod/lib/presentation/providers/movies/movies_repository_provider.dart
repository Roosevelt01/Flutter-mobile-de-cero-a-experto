import 'package:cinemapedia/config/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/config/infrastructure/repositores/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Paso 1: Provider de solo lectura para el repositorio de películas.
// Su propósito es proporcionar una instancia inmutable de MovieRepositoryImpl.
final movieRepositoryProvider = Provider((ref) {
  // La implementación concreta del repositorio que usa TheMovieDB como fuente de datos.
});

// Paso 2: Implementación del provider.
final movieRepositoryProvider = Provider((ref) {
  // Paso 2.1: Se retorna una instancia de la implementación del repositorio.
  // Se le inyecta la fuente de datos concreta (MoviedbDatasource) que se usará
  // para obtener la información de las películas.
  return MovieRepositoryImpl(MoviedbDatasource());
});