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
  final GetMovieCallback getMovie; // La dependencia

  MovieMapNotifier({
    required this.getMovie, // Inyección en el constructor
  }): super({});
}

//Paso 4: Implementar la Verificación de Caché
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>>{
    final GetMovieCallback getMovie; // La dependencia

    MovieMapNotifier({
      required this.getMovie, 
    }): super({});

    Future<void> loadMovie(String movieId) async{
      //Paso 4.1: Verificamos si la pelicula ya esta en el estado
      if(state[movieId] != null) return;
      
      // Si no existe, continuamos...
    }
}

//Paso 5: Obtener Datos y Actualizar el Estado
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>>{
    final GetMovieCallback getMovie; 

    MovieMapNotifier({
      required this.getMovie, 
    }): super({});

    Future<void> loadMovie(String movieId) async{
      if(state[movieId] != null) return;

      print('Realizando petición HTTP para: $movieId'); // Log para verificar que el caché funciona
      
      final movie = await getMovie(movieId); // Petición de red

      // Actualización del Estado (Inmutable)
      // Creamos un nuevo mapa con todas las películas anteriores (...state)
      // y añadimos la nueva entrada (movieId: movie).
      state = { ...state, movieId: movie };    
    }
}