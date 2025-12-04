//Paso 1: Cambiamos stateless por stateful widget
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

class MovieMapNotifier extends StateNotifier<Map<String, Movie>>{
  
}

//Paso 2: Agregamos el metodo initState
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

class MovieMapNotifier extends StateNotifier<Map<String, Movie>>{
    //Paso 2.1: Inicializamos el estado con un mapa vacio
    MovieMapNotifier(): super({});
}

//Paso 3: Inyectar la Dependencia (getMovie)
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

// Definición del tipo de función
typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>>{
    MovieMapNotifier(): super({});

  final GetMovieCallback getMovie; // La dependencia

  MovieMapNotifier({
    required this.getMovie, // Inyección en el constructor
  }): super({});
}

//Paso 4: AObtener Datos y Actualizar el Estado
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

class MovieMapNotifier extends StateNotifier<Map<String, Movie>>{
    MovieMapNotifier(): super({});

    Future<void> loadMovie(String movieId) async{
      //Paso 4.1: Verificamos si la pelicula ya esta en el estado
      if(state[movieId] != null) return;
    }
}






//Paso 4: Agregamos la logica para cargar una pelicula solo si no esta en el estado
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

class MovieMapNotifier extends StateNotifier<Map<String, Movie>>{
    MovieMapNotifier(): super({});

    Future<void> loadMovie(String movieId) async{
      //Paso 4.1: Verificamos si la pelicula ya esta en el estado
      if(state[movieId] != null) return;
    }
}

//Paso 5: Agregamos la logica para obtener una pelicula usando una funcion externa
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

//Paso 5.1: Definimos un typedef para la funcion que obtiene una pelicula por su ID
typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>>{
    //Paso 5.2: Agregamos un parametro en el constructor para recibir la funcion
    final GetMovieCallback getMovie;
    
    //Paso 5.3: Actualizamos el constructor para recibir la funcion
    MovieMapNotifier({
      required this.getMovie
    }): super({});

    Future<void> loadMovie(String movieId) async{
      if(state[movieId] != null) return;

      //Paso 5.4: Usamos la funcion para obtener la pelicula
      final movie = await getMovie(movieId);

      //Paso 5.5: Actualizamos el estado con la nueva pelicula
      state = { ...state, movieId: movie };
    }
}

//Paso 6: Creamos el provider para el MovieMapNotifier (oódigo final)
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/legacy.dart';

//Paso 6.1: Definimos el provider para el MovieMapNotifier
final movieInfoProvider = StateNotifierProvider((ref){
  //Paso 6.2: Obtenemos el MovieRepository desde otro provider
  final movieRepository  = ref.watch(movieRepositoryProvider);

  //Paso 6.3: Retornamos una instancia de MovieMapNotifier
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

      final movie = await getMovie(movieId);

      state = { ...state, movieId: movie };
    }
}