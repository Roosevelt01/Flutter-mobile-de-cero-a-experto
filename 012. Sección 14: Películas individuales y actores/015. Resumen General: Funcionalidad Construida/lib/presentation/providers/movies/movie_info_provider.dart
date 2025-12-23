//Paso 1: Se realiza las modificaciones necesarias en movie_info_provider.dart
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/legacy.dart';

//Paso 1.1: tenemos que modoficar final movieInfoProvider para agregar <MovieMapNotifier, Map<String, Movie>> 
// Ya que ahora el StateNotifier maneja un Map de peliculas(Va con el paso 3 de movie_screen.dart)
final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref){
  final movieRepository  = ref.watch(movieRepositoryProvider);

  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>>{
    final GetMovieCallback getMovie;
    
    MovieMapNotifier({
      required this.getMovie
    }): super({});

    Future<void> loadMovie(String movieId) async{
      if(state[movieId] != null) return;
      //Paso 1.1: Usaremos este print para verificar que no se hagan peticiones repetidas
      print("Realizando peticion para http: $movieId"); 
      final movie = await getMovie(movieId);

      state = { ...state, movieId: movie };
    }
}