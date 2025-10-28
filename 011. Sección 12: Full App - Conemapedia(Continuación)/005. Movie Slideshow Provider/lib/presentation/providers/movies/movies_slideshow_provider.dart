
// Paso 1: Definición inicial del provider.
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Se crea un provider simple que inicialmente no retorna datos (null).
final moviesSlideshowProvider = Provider((ref) => null );

// Paso 2: Conectar con el provider de películas.
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideshowProvider = Provider((ref) {
  // El provider ahora "observa" (watch) el estado de `nowPlayingMoviesProvider` para reaccionar a sus cambios.
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
});

// Paso 3: Limitar el número de películas para el slideshow.
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideshowProvider = Provider((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider); 
  
  // Se añade lógica para manejar el caso de una lista vacía y evitar errores.
  if( nowPlayingMovies.isEmpty ) return [];

  // Se limita el resultado a las primeras 6 películas de la lista.
  return nowPlayingMovies.sublist(0, 6);
});

// Paso 4: Versión final con tipado explícito y lógica robusta.(Código final)
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider que expone solo las primeras 6 películas de la lista de "now playing".
///
/// Es de tipo `Provider<List<Movie>>` para asegurar que siempre devuelva una
/// lista de películas, facilitando su uso en la UI sin necesidad de castings.
final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  // Observa el estado del provider que contiene todas las películas en cartelera.
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider); 
  
  // Si no hay películas, retorna una lista vacía para evitar errores.
  if( nowPlayingMovies.isEmpty ) return []; 

  // Retorna una sublista con las primeras 6 películas.
  return nowPlayingMovies.sublist(0, 6); 
});
