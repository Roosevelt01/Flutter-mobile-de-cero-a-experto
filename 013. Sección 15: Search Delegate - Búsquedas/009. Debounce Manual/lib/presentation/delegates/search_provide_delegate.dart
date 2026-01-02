//Paso 1: Implementar el debounce en la busqueda de peliculas
/*import 'dart:async'; // Importamos dart:async para usar StreamController
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart'; 
import 'package:cinemapedia/domain/entities/movie.dart'; 
import 'package:flutter/material.dart'; 

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
 
  final SearchMoviesCallback searchMovies;
  //Paso 1.1 Usamos un StreamController para el debounce de la busqueda
  StreamController<List<Movie>> debounceMobies = StreamController.broadcast()

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

        final movies = snapshot.data ?? []; 

        return ListView.builder(
          itemCount: movies.length, 
          itemBuilder: (context, index) => _MovieItem(
            movie: movies[index],
            onMovieSelected: close,
          ),
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  final Function onMovieSelected;

  const _MovieItem({
    required this.movie,
    required this.onMovieSelected, 
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme; 
    final size = MediaQuery.of(context).size;
   
    return GestureDetector(
      onTap: () => onMovieSelected(context, movie),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          
          child: Row(
            children: [
              
              SizedBox(
                width: size.width * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), 
                  child: Image.network( movie.posterPath ), 
                ),
              ),
      
              const SizedBox(width: 10,), 
      
              SizedBox(
                width: size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text( 
                          movie.title, 
                          style: textStyle.titleMedium, 
                        ),
      
                    (movie.overview.length > 100)
                      ? Text( '${ movie.overview.substring(0, 100)}...' )
                      : Text( movie.overview 
                    ),
                    
                    Row(
                      children: [
                        Icon(Icons.star_half_rounded, color: Colors.yellow.shade800,),
                        const SizedBox(width: 5,),
                        
                        Text( 
                          HumanFormarts.number( movie.voteAverage,2),
                          style: textStyle.bodyMedium!.copyWith(color: Colors.yellow.shade800),
                        ),
                      ],
                    )
      
                  ],
                ),
              ),    
            ],
          ), 
      
      ),
    );
  }
}*/

//Paso 2: Implementar el StreamBuilder para la busqueda de peliculas con debounce
//import 'dart:async'; 
/*import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart'; 
import 'package:cinemapedia/domain/entities/movie.dart'; 
import 'package:flutter/material.dart'; 

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
 
  final SearchMoviesCallback searchMovies;
  StreamController<List<Movie>> debounceMobies = StreamController.broadcast()
  
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
    //Paso 2.1: Usamos el StreamBuilder en lugar del FutureBuilder
    return StreamBuilder(
      stream: debounceMobies.stream, // Usamos el stream del StreamController
      builder: (context, snapshot) {

        final movies = snapshot.data ?? []; 

        return ListView.builder(
          itemCount: movies.length, 
          itemBuilder: (context, index) => _MovieItem(
            movie: movies[index],
            onMovieSelected: close,
          ),
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  final Function onMovieSelected;

  const _MovieItem({
    required this.movie,
    required this.onMovieSelected, 
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme; 
    final size = MediaQuery.of(context).size;
   
    return GestureDetector(
      onTap: () => onMovieSelected(context, movie),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          
          child: Row(
            children: [
              
              SizedBox(
                width: size.width * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), 
                  child: Image.network( movie.posterPath ), 
                ),
              ),
      
              const SizedBox(width: 10,), 
      
              SizedBox(
                width: size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text( 
                          movie.title, 
                          style: textStyle.titleMedium, 
                        ),
      
                    (movie.overview.length > 100)
                      ? Text( '${ movie.overview.substring(0, 100)}...' )
                      : Text( movie.overview 
                    ),
                    
                    Row(
                      children: [
                        Icon(Icons.star_half_rounded, color: Colors.yellow.shade800,),
                        const SizedBox(width: 5,),
                        
                        Text( 
                          HumanFormarts.number( movie.voteAverage,2),
                          style: textStyle.bodyMedium!.copyWith(color: Colors.yellow.shade800),
                        ),
                      ],
                    )
      
                  ],
                ),
              ),    
            ],
          ), 
      
      ),
    );
  }
}*/

//Paso 3:  
import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart'; 
import 'package:cinemapedia/domain/entities/movie.dart'; 
import 'package:flutter/material.dart'; 

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
 
  final SearchMoviesCallback searchMovies;
  StreamController<List<Movie>> debounceMobies = StreamController.broadcast();
  //Paso 3.1: Agregamos un Timer para el debounce de la busqueda para controlar el tiempo entre cada busqueda
  Timer? _debounceTimer;
  
  SearchMovieDelegate({
    required this.searchMovies,
  });

  
  //Paso 3.2: Agregamos el metodo _onQueryChanged que se ejecutará cada vez que el query cambie y el String este inactivo por 500ms
  void _onQueryChanged(String query) {

        //Lanzamos un nuevo Timer cada vez que el query cambia
    print("Query String Cambió");
  
   //Si el Timer esta activo, lo cancelamos y si no, lo creamos uno nuevo
    if(_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    //Creamos un nuevo Timer que se ejecutará despues de 500ms
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      print("Buscando película");

    });

  }

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

        //Paso 3.3: Llamamos al metodo _onQueryChanged cada vez que el query cambia
        _onQueryChanged(query);

    return StreamBuilder(
      stream: debounceMobies.stream,
      builder: (context, snapshot) {
       
        final movies = snapshot.data ?? []; 

        return ListView.builder(
          itemCount: movies.length, 
          itemBuilder: (context, index) => _MovieItem(
            movie: movies[index],
            onMovieSelected: close,
          ),
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  final Function onMovieSelected;

  const _MovieItem({
    required this.movie,
    required this.onMovieSelected, 
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme; 
    final size = MediaQuery.of(context).size;
   
    return GestureDetector(
      onTap: () => onMovieSelected(context, movie),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          
          child: Row(
            children: [
              
              SizedBox(
                width: size.width * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), 
                  child: Image.network( movie.posterPath ), 
                ),
              ),
      
              const SizedBox(width: 10,), 
      
              SizedBox(
                width: size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text( 
                          movie.title, 
                          style: textStyle.titleMedium, 
                        ),
      
                    (movie.overview.length > 100)
                      ? Text( '${ movie.overview.substring(0, 100)}...' )
                      : Text( movie.overview 
                    ),
                    
                    Row(
                      children: [
                        Icon(Icons.star_half_rounded, color: Colors.yellow.shade800,),
                        const SizedBox(width: 5,),
                        
                        Text( 
                          HumanFormarts.number( movie.voteAverage,2),
                          style: textStyle.bodyMedium!.copyWith(color: Colors.yellow.shade800),
                        ),
                      ],
                    )
      
                  ],
                ),
              ),    
            ],
          ), 
      
      ),
    );
  }
}
