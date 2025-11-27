import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

//Paso 1: Se crea un provider para las películas que están por estrenarse.
final upComingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  // Se obtiene la referencia a la función `getUpcoming` del repositorio de películas.
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;

  // Se crea una instancia de `MoviesNotifier` pasándole la función específica para obtener las películas.
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

//Paso 2: Se crea un provider para las películas mejor calificadas.
final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  // Se obtiene la referencia a la función `getTopRated` del repositorio de películas.
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;

  // Se crea una instancia de `MoviesNotifier` con la función correspondiente.
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>>{
  int currentPage = 0;
  bool isLoading = false; 
  MovieCallback fetchMoreMovies;

  MoviesNotifier(
    { required this.fetchMoreMovies }
  ): super([]); 

  Future<void> loadNextPage() async{
    if(isLoading) return; 
    isLoading = true;  
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false; 
  }
}

// Este archivo define los `providers` de Riverpod que gestionan el estado de las diferentes listas de películas en la aplicación. Cada provider (`nowPlayingMoviesProvider`, `popularMoviesProvider`, etc.) utiliza un `MoviesNotifier` genérico para manejar la carga paginada de datos y el estado de la lista. Al centralizar la lógica en `MoviesNotifier` y simplemente pasarle la función de "fetch" correcta, se evita la duplicación de código y se mantiene una arquitectura limpia y escalable para manejar múltiples listas de películas.