//Paso 1: Con SearchMoviesCallback permitimos que el SearchDelegate pueda buscar películas usando un callback
/*import 'package:animate_do/animate_do.dart'; 
import 'package:cinemapedia/domain/entities/movie.dart'; 
import 'package:flutter/material.dart'; 

//Paso 1.1: Definir un  typedef para la función que buscará las películas
typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
 
  //Paso 1.2: Agregar el callback en el constructor
  final SearchMoviesCallback searchMovies;

  //Paso 1.3: Modificar el constructor para recibir el callback  
  SearchMovieDelegate({
    required this.searchMovies,
  });

  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
           
    return [

        FadeIn( 
          animate: query.isNotEmpty, 
          duration: const Duration(milliseconds: 200), 
          child: IconButton(
            onPressed: () => query = '', 
            icon: const Icon( Icons.clear) 
          ),
        ),
      
    ];
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), 
       icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    );
  }
  
  @override
  Widget buildResults(BuildContext context) {
    return const Text("buildResults");
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text("buildSuggestions");
  }
}*/

//Paso 2: Modificar el SearchDelegate para usar el callback para buscar películas
/*import 'package:animate_do/animate_do.dart'; 
import 'package:cinemapedia/domain/entities/movie.dart'; 
import 'package:flutter/material.dart'; 

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
 
  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({
    required this.searchMovies,
  });

  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
           
    return [

        FadeIn( 
          animate: query.isNotEmpty, 
          duration: const Duration(milliseconds: 200), 
          child: IconButton(
            onPressed: () => query = '', 
            icon: const Icon( Icons.clear) 
          ),
        ),
      
    ];
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), 
       icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    );
  }
  
  @override
  Widget buildResults(BuildContext context) {
    return const Text("buildResults");
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    //Paso 2.1: Usar el callback para buscar películas
    return FutureBuilder(
      future: searchMovies(query), //Usamos el callback aquí para buscar películas
      builder: (context, snapshot) {

        return ListTile();
      },
    );
  }
}*/

//Paso 3: Completar el FutureBuilder para mostrar las películas sugeridas
import 'package:animate_do/animate_do.dart'; 
import 'package:cinemapedia/domain/entities/movie.dart'; 
import 'package:flutter/material.dart'; 

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
 
  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({
    required this.searchMovies,
  });

  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
           
    return [

        FadeIn( 
          animate: query.isNotEmpty, 
          duration: const Duration(milliseconds: 200), 
          child: IconButton(
            onPressed: () => query = '', 
            icon: const Icon( Icons.clear) 
          ),
        ),
      
    ];
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), 
       icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    );
  }
  
  @override
  Widget buildResults(BuildContext context) {
    return const Text("buildResults");
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMovies(query), 
      builder: (context, snapshot) {

        //Paso 3.1: Manejar los diferentes estados del FutureBuilder
        final movies = snapshot.data ?? []; 

        //Paso 3.2: Mostrar un indicador de carga mientras se obtienen los datos
        return ListView.builder(
          itemCount: movies.length, //Número de películas obtenidas para el query
          itemBuilder: (context, index) {

          final movie = movies[index]; //Obtener la película en la posición index para mostrarla
          return ListTile( title: Text(movie.title)); //Mostrar el título de la película para cada item


          }//Cierre itemBuilder,
        );
      },
    );
  }
}