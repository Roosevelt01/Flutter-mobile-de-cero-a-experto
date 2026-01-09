//Paso 2: añadimos el método clearStreams y lo llamamos en los lugares adecuados
import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart'; 
import 'package:cinemapedia/domain/entities/movie.dart'; 
import 'package:flutter/material.dart'; 

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
 
  final SearchMoviesCallback searchMovies;

  //Paso  1.1: añadimos la lista de películas iniciales y el constructor
  final List< Movie > initialMovies; 

  StreamController<List<Movie>> debounceMovies = StreamController.broadcast();
  
  Timer? _debounceTimer;
  
  SearchMovieDelegate({
    required this.searchMovies,
    required this.initialMovies, //Paso 1.2: inicializamos la lista de películas
  });

  void clearStreams(){
    debounceMovies.close(); 
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
      clearStreams(); 
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
      initialData: initialMovies, //Paso 1.3: mostramos las películas iniciales
      stream: debounceMovies.stream,
      builder: (context, snapshot) {
       
        final movies = snapshot.data ?? []; 

        return ListView.builder(
          itemCount: movies.length, 
          itemBuilder: (context, index) => _MovieItem(
            movie: movies[index],
            onMovieSelected: ( context, movie){
              clearStreams(); 
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