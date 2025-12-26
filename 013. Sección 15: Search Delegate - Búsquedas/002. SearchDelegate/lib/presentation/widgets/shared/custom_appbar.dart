//Paso 1:  modificamos el boton de búsqueda en el CustomAppBar 
import 'package:cinemapedia/presentation/delegates/search_provide_delegate.dart'; //Paso 1.1: Importar el SearchDelegate
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

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
                    //Paso 1.2: Llamar a la función nativa showSearch
                    // showSearch se encarga de empujar la pantalla de búsqueda al stack de navegación.
                    // final searchedMovies = */
                    showSearch(
                      context: context, 
                      delegate: SearchMovieDelegate()//Paso 1.3: Pasar una nueva instancia de nuestro SearchMovieDelegate
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