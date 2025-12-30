//Paso 1: Agregamos el ícono de estrella y el voto promedio de la película en los resultados de búsqueda.
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

  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme; 

    final size = MediaQuery.of(context).size;
   
    return Padding(
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
                  
                  //PAso 1.1: Agregar una fila que muestre el ícono de estrella y el voto promedio de la película.
                  Row(
                    children: [
                      // Usar el ícono de estrella bordeada y mostrar el voto promedio.
                      Icon(Icons.star_half_rounded, color: Colors.yellow.shade800,),
                      const SizedBox(width: 5,),
                      
                      // Mostrar el voto promedio de la película.
                      Text( 
                        HumanFormarts.number( movie.voteAverage,2), // Usar 2 decimales para el voto promedio.
                        style: textStyle.bodyMedium!.copyWith(color: Colors.yellow.shade800),
                      ),
                    ],
                  )

                ],
              ),
            ),    
          ],
        ), 

    );
  }
}