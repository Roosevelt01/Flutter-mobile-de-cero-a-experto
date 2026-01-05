//Paso 1: Agregamos la función onMovieSelected para manejar la selección de la película
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart'; 
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

        final movies = snapshot.data ?? []; 

        return ListView.builder(
          itemCount: movies.length, 
          itemBuilder: (context, index) => _MovieItem(movie: movies[index]),
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  //Paso 1.1: Agregamos onMovieSelected para manejar la selección de la película
  final Function onMovieSelected;

  const _MovieItem({
    required this.movie,
    required this.onMovieSelected, //Paso 1.2: Agregamos onMovieSelected al constructor
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme; 
    final size = MediaQuery.of(context).size;
   
    //Paso 1.3: Usamos onMovieSelected en lugar de close directamente
    return GestureDetector(
      onTap: () => onMovieSelected(context, movie), // Llamamos a onMovieSelected al tocar el ítem
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

//Paso 2: Modificar el código para pasar close como onMovieSelected
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart'; 
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

        final movies = snapshot.data ?? []; 

        return ListView.builder(
          itemCount: movies.length, 
          itemBuilder: (context, index) => _MovieItem(
            movie: movies[index],
            onMovieSelected: close, //Paso 2.1: Pasamos close como onMovieSelected
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