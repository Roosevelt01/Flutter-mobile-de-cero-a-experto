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
                    //Paso 1.2: Usar el showSearch para abrir el SearchDelegate
                    showSearch(
                      context: context, 
                      delegate: SearchMovieDelegate()//Paso 1.3: Pasar el SearchDelegate
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
