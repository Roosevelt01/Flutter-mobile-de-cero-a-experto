//Paso 1: usamos el if para query.isEmpty en el método _onQueryChanged

import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart'; 
import 'package:cinemapedia/domain/entities/movie.dart'; 
import 'package:flutter/material.dart'; 

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
 
  final SearchMoviesCallback searchMovies;
  StreamController<List<Movie>> debounceMovies = StreamController.broadcast();
  
  Timer? _debounceTimer;
  
  SearchMovieDelegate({
    required this.searchMovies,
  });

  
  void _onQueryChanged(String query) {

    if(_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      //Paso 1.1: Llamar al callback de búsqueda
      if(query.isEmpty){
        debounceMovies.add([]);
        return;
      }

      //Paso 1.2: Obtener las películas a partir del callback
      final movies = await searchMovies(query);//llama al callback de búsqueda

      debounceMovies.add(movies); //Agrega las películas al stream
    });

  } // Ciere _onQueryChanged

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

        _onQueryChanged(query);

    return StreamBuilder(
      stream: debounceMovies.stream,
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

//Paso 2: añadimos el método clearStreams y lo llamamos en los lugares adecuados
import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart'; 
import 'package:cinemapedia/domain/entities/movie.dart'; 
import 'package:flutter/material.dart'; 

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
 
  final SearchMoviesCallback searchMovies;
  StreamController<List<Movie>> debounceMovies = StreamController.broadcast();
  
  Timer? _debounceTimer;
  
  SearchMovieDelegate({
    required this.searchMovies,
  });

  //Paso 2.1: Método para cerrar el stream cuando ya no se necesite
  void clearStreams(){
    debounceMovies.close(); //Cierra el stream
  }

  void _onQueryChanged(String query) {

    if(_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      
      if(query.isEmpty){
        debounceMovies.add([]);
        return;
      }

      final movies = await searchMovies(query);

      debounceMovies.add(movies); 
    });

  } // Ciere _onQueryChanged

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
      onPressed: ()  {
      clearStreams(); //Paso 2.1: Llamar al método para cerrar el stream  
      close(context, null);
      },
       icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    );
  }
  
  @override
  Widget buildResults(BuildContext context) {
    return const Text("buildResults");
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {

        _onQueryChanged(query);

    return StreamBuilder(
      stream: debounceMovies.stream,
      builder: (context, snapshot) {
       
        final movies = snapshot.data ?? []; 

        return ListView.builder(
          itemCount: movies.length, 
          itemBuilder: (context, index) => _MovieItem(
            movie: movies[index],
            //Modificamos  la función onMovieSelected
            onMovieSelected: ( context, movie){
              clearStreams(); //Paso 2.2: Llamar al método para cerrar el stream  
              close(context, movie); 
            },
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