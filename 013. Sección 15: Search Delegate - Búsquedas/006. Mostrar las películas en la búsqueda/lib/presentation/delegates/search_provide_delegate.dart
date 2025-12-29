//Paso 1: _MovieItem es un widget que representa cada película en la lista de sugerencias.
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
    return FutureBuilder(
      future: searchMovies(query), 
      builder: (context, snapshot) {

        final movies = snapshot.data ?? []; 

        return ListView.builder(
          itemCount: movies.length, 
          //Paso 1.1: El _MovieItem es un widget que representa cada película en la lista de sugerencias.
          itemBuilder: (context, index) => _MovieItem(movie: movies[index]),
        );
      },
    );
  }
}

//Paso 1.2: El _MovieItem es un widget que representa cada película en la lista de sugerencias.
class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}*/

//Paso 2: Implementar el widget _MovieItem para mostrar la información de la película.
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
    //Paso 2.1: Obtener los estilos de texto del tema actual
    final TextStyle = Theme.of(context).textTheme; 

    //Paso 2.2: Construir el widget que muestra la información de la película
    final size = MediaQuery.of(context).size;
   
    //Paso 2.3: Retornar el widget con la información de la película
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), //Espaciado alrededor del ítem
        
        child: Row( //Usar un Row para alinear la imagen y el texto horizontalmente
          //Agregar los hijos del Row
          children: [
            
            //Image de la película, con un contenedor para darle tamaño y bordes redondeados
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), //Bordes redondeados para la imagen
                child: Image.network( movie.posterPath ), //Cargar la imagen desde la URL del póster
              ),//Cierre del ClipRRect

            ),



          ],
        ), //Cierre del Row

    ); //Cierre del Padding
  }
}*/

//Paso 3: 
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
    final TextStyle = Theme.of(context).textTheme; 

    final size = MediaQuery.of(context).size;
   
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), //Espaciado alrededor del ítem
        
        child: Row(
          children: [
            
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), 
                child: Image.network( movie.posterPath ), 
              ),
            ),

            const SizedBox(width: 10,), //Espacio entre la imagen y el texto

            //Paso 3.1: Mostrar el título de la película, ajustando según la longitud del overview
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  //Mostrar el título de la película
                  Text( 
                        movie.title, 
                        style: TextStyle.titleMedium, 
                      ),

                  //Mostrar el overview de la película, ajustando según la longitud
                  (movie.overview.length > 100)
                    ? Text( '${ movie.overview.substring(0, 100)}...' )
                    : Text( movie.overview 
                  ),

                ],
              ),
            ),    


          ],
        ), 

    );
  }
}