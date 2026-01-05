//Paso 1: Modificamos el IconButton para que abra el SearchDelegate y capture la película seleccionada
import 'package:cinemapedia/domain/entities/movie.dart'; // Importamos la entidad Movie
import 'package:cinemapedia/presentation/delegates/search_provide_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override 
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = Theme.of(context).colorScheme;

    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
        child: Padding(
          padding : const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.movie_outlined, color: colors.primary),
                const SizedBox(width: 5),
                Text('Cinemapedia', style: titleStyle?.copyWith(color: colors.primary) ),
        
                const Spacer(),
                
                 //Paso 1.1: Agregamos el async a la función onPressed 
                 IconButton(onPressed: () async {

                    final movieRepository = ref.read(movieRepositoryProvider);  

                    //Paso 1.2: Creamos la variable movie para capturar el resultado del showSearch
                    //También se agrega <Movie?> para indicar que puede regresar un Movie o null
                    final movie = await showSearch<Movie?> (
                      context: context, 
                      delegate: SearchMovieDelegate(
                        searchMovies: movieRepository.searchMovies
                      )
                    );

                    //Paso 1.3: Imprimimos en consola la película seleccionada
                    print('Movie seleccionada: ${movie?.title}');
                 },

                 icon: const Icon(Icons.search)
                 )
              ],
            )
          )
        ),
    );
  }
}*/

//Paso 2: 
import 'package:cinemapedia/domain/entities/movie.dart'; 
import 'package:cinemapedia/presentation/delegates/search_provide_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart'; 

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override 
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = Theme.of(context).colorScheme;

    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
        child: Padding(
          padding : const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.movie_outlined, color: colors.primary),
                const SizedBox(width: 5),
                Text('Cinemapedia', style: titleStyle?.copyWith(color: colors.primary) ),
        
                const Spacer(),
                
                //Paso 2.1: Modificamos el onPressed para usar .then en lugar de async/await
                 IconButton(onPressed: (){

                    final movieRepository = ref.read(movieRepositoryProvider);  
                    
                    showSearch<Movie?>(
                      context: context, 
                      delegate: SearchMovieDelegate(
                        searchMovies: movieRepository.searchMovies
                      )
                    ).then((movie) { // Usamos .then para capturar el resultado
                         if (movie == null) return; // Si es null no hacemos nada

                          // Navegamos a la página de detalles usando go_router
                         context.push('/movies/${ movie.id }'); 
                    });

                 },

                 icon: const Icon(Icons.search)
                 )
              ],
            )
          )
        ),
    );
  }
}