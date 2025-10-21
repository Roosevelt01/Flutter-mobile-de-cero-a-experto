
// Paso 1: Definición de la clase Notifier.
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

// 1.1: Se define la clase que gestionará el estado (una lista de películas).
// Extiende de `StateNotifier` para integrarse con Riverpod.
class MoviesNotifier extends StateNotifier<List<Movie>> {

}

// Paso 2: Inicialización del estado.
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

class MoviesNotifier extends StateNotifier<List<Movie>> {
  // 2.1: El constructor llama al constructor de la clase padre (`super`)
  // con el estado inicial: una lista vacía de películas.
  MoviesNotifier(): super([]);
}

// Paso 3: Creación del Provider y control de paginación.
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

// 3.1: Se crea el `StateNotifierProvider`. Este provider creará y expondrá
// una instancia de `MoviesNotifier`, permitiendo a la UI observar su estado.
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  return MoviesNotifier();
});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0; // 3.2: Se añade una variable para controlar la paginación.

  MoviesNotifier(): super([]); 
}

// Paso 4: Definición del método para cargar más películas.
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  return MoviesNotifier();
});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;

  MoviesNotifier(): super([]); 

  // 4.1: Se define el método asíncrono que la UI llamará para cargar la siguiente página.
  Future<void> loadNextPage() async {}
}

// Paso 5: Implementación del incremento de página.
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  return MoviesNotifier();
});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;

  MoviesNotifier(): super([]); 

  Future<void> loadNextPage() async {
    currentPage++; // 5.1: Se incrementa el contador de la página.
  }
}

// Paso 6: Inyección de dependencias para la obtención de datos.
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  return MoviesNotifier();
});

// 6.1: Se define un tipo `MovieCallback` para desacoplar el Notifier de una
// fuente de datos concreta. Representa cualquier función que obtenga películas.
typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMoreMovies; // 6.2: Propiedad para almacenar la función de callback.

  // 6.3: El constructor ahora requiere que se le pase la función para obtener películas.
  MoviesNotifier({
    required this.fetchMoreMovies,
  }): super([]); 

  Future<void> loadNextPage() async {
    currentPage++;
  }
}

// Paso 7: Lógica final para cargar y actualizar el estado.
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  return MoviesNotifier();
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies,
  }): super([]); 

  Future<void> loadNextPage() async {
    currentPage++;
    // 7.1: Se llama a la función `fetchMoreMovies` para obtener la nueva página.
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    // 7.2: Se actualiza el estado, añadiendo las nuevas películas a las ya existentes.
    state = [...state, ...movies];
  }
}

// Paso 8: Conexión final del Provider con el Repositorio.(Código final)
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  // 8.1: Se obtiene la función `getNowPlaying` del repositorio de películas.
  // `ref.watch` asegura que si el repositorio cambia, este provider se reconstruya.
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  // 8.2: Se crea la instancia del Notifier y se le inyecta la función para obtener películas.
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>>{
  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  MoviesNotifier(
    { required this.fetchMoreMovies }
  ): super([]); 

  Future<void> loadNextPage() async{
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}