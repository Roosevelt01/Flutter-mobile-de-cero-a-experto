//Paso 1: Se crea un `StateNotifierProvider` para gestionar el estado de la lista de películas.

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>>{
  int currentPage = 0;
  bool isLoading = false; // Paso 1.1: Se crea una bandera para controlar si una petición está en curso.
  MovieCallback fetchMoreMovies;

  MoviesNotifier(
    { required this.fetchMoreMovies }
  ): super([]); 

  Future<void> loadNextPage() async{
    if(isLoading) return; //Paso 1.2: Si ya está cargando, no se hace nada para evitar peticiones duplicadas.
    isLoading = true;  //Paso 1.3: Se marca como "cargando" para bloquear peticiones futuras.
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    // Paso: 1.4 Se añade un pequeño retardo para evitar llamadas consecutivas muy rápidas.
    await Future.delayed(const Duration(milliseconds: 300)); 
    isLoading = false; //Paso 1.5: Se marca como "no cargando" para permitir futuras peticiones.
  }
}