//Paso 1: Se define el provider `nowPlayingMoviesProvider` para gestionar el estado de las películas en cartelera.
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

//Paso 1.1: Se define el provider `popularMoviesProvider` para gestionar el estado de las películas populares.
// Sigue el mismo patrón que `nowPlayingMoviesProvider`, pero con una fuente de datos diferente.
final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  // Obtiene la referencia a la función `getPopular` del repositorio de películas.
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;

  // Retorna una nueva instancia del notificador, esta vez configurada para usar la función `getPopular`.
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
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

// El `popularMoviesProvider` es un gestor de estado que se encarga de mantener y actualizar la lista de películas populares. Utiliza la clase `MoviesNotifier` para manejar la lógica de paginación y carga de datos. Al crearse, se le inyecta la función `getPopular` del `movieRepositoryProvider`. De esta manera, cuando se llama a `loadNextPage()` en este provider, se obtendrá la siguiente página de películas populares de la API y se añadirá al estado actual, permitiendo a la UI mostrar una lista infinita de películas populares.