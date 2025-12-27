//Paso 1: Cambiamos de StatelessWidget a ConsumerWidget para poder usar Riverpod
import 'package:cinemapedia/presentation/delegates/search_provide_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Paso 1.1: Importar flutter_riverpod

//Paso 1.2: Usar ConsumerWidget en lugar de StatelessWidget
class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override //Paso 1.3: Agregar el parámetro ref en el método build
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
        
                 IconButton(onPressed: (){
                    showSearch(
                      context: context, 
                      delegate: SearchMovieDelegate()
                      );
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

//Paso 2: 
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
        
                 IconButton(onPressed: (){

                    //Paso 2.1: Leer el MovieRepository desde Riverpod    
                    final movieRepository = ref.read(movieRepositoryProvider);  

                    showSearch(
                      context: context, 
                      delegate: SearchMovieDelegate(
                        //Paso 2.2: Pasar el callback que usa el MovieRepository para buscar películas
                        searchMovies: movieRepository.searchMovies
                      )
                      );
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