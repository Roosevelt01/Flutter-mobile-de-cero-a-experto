//Paso 1: Comenzamos creando el provider para el valor de búsqueda inicial
/*import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart'; // Importamos Riverpod

final searchQueryProvider = StateProvider<String>((ref) => '');

//Paso 1.1: Creamos un StateNotifier para manejar la lista de películas buscadas
class SearchedMoviesProvicer extends StateNotifier<List<Movie>> {
  
  // Constructor que inicializa el estado con una lista vacía  
  SearchedMoviesProvicer(): super([]);



}*/

//Paso 2: con searchMoviesByQuery añadido podemos buscar películas por query
/*import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart'; // Importamos Riverpod

final searchQueryProvider = StateProvider<String>((ref) => '');

class SearchedMoviesProvicer extends StateNotifier<List<Movie>> {
  
  SearchedMoviesProvicer(): super([]);

  //PAso 2.1: Agregamos el método para buscar películas por query
  Future<List<Movie>> searchMoviesByQuery(String query) async {
    
    return [];

  }
}*/

//Paso 3: Añadimos la funcionalidad de búsqueda real usando un callback
/*import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart'; // Importamos Riverpod

final searchQueryProvider = StateProvider<String>((ref) => '');

//Paso 3.1: Definimos un typedef para la función de búsqueda de películas
typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesProvicer extends StateNotifier<List<Movie>> {
  
  //Paso 3.2: Añadimos el callback de búsqueda de películas al constructor  
  final SearchMoviesCallback searchMovies;

  SearchedMoviesProvicer( {
    //Paso 3.3: Pasamos el callback de búsqueda de películas al constructor
    required this.searchMovies
    }): super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    
    //Paso 3.4: Usamos el callback para buscar películas
    final List<Movie> movies = await searchMovies(query);
 
    //Paso 3.5: Actualizamos el estado con las películas encontradas   
    state = movies;

    //Paso 3.6: Devolvemos las películas encontradas
    return movies;

  }
}*/

//Paso 4: Usamos Ref para actualizar el valor del provider de búsqueda
/*import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart'; // Importamos Riverpod

final searchQueryProvider = StateProvider<String>((ref) => '');

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesProvicer extends StateNotifier<List<Movie>> {
  
  final SearchMoviesCallback searchMovies;
  //Paso 4.1: Añadimos una referencia a Ref para poder leer otros providers
  final Ref ref;

  SearchedMoviesProvicer( {
    required this.searchMovies
    , required this.ref //Paso 4.2: Añadimos ref al constructor
    }): super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    
    final List<Movie> movies = await searchMovies(query);
    //Paso 4.3: Actualizamos el valor del provider con la última búsqueda
    ref.read(searchQueryProvider.notifier).update((state) => query); 
 
    state = movies;

    return movies;

  }
}*/

//Paso 5: Definimos el provider para el StateNotifier 
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart'; // Importamos Riverpod

final searchQueryProvider = StateProvider<String>((ref) => '');

//Paso 5.1: Definimos el provider para el StateNotifier
final searchedMoviesProvider = StateNotifierProvider<SearchedMoviesProvicer, List<Movie>>((ref) {
    //Paso 5.2: Leemos el movieRepositoryProvider para pasarlo al StateNotifier
    final movieRepository = ref.read(movieRepositoryProvider);

    //Paso 5.3: Retornamos una instancia de SearchedMoviesProvicer    
    return SearchedMoviesProvicer(
      searchMovies: movieRepository.searchMovies,
      ref: ref,
    );
  }
);


typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesProvicer extends StateNotifier<List<Movie>> {
  
  final SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchedMoviesProvicer( {
    required this.searchMovies
    , required this.ref 
    }): super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query); 
 
    state = movies;

    return movies;
  }
}