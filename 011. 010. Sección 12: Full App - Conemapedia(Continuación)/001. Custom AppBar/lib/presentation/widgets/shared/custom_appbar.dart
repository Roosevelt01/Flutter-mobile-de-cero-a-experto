//Paso 1: Estructura básica inicial del AppBar.
/*import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    //Paso 1.1:
    return SafeArea(
      child: Padding(
        padding : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [],
          )
        )
      )
    );
  }
}*/

//Paso 2: Se añaden los elementos visuales como el icono, título y botón de búsqueda.
/*import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    //Paso 2.1:
    final colors = Theme.of(context).colorScheme;

    //Paso 2.2:
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      child: Padding(
        padding : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
               //Paso 2.3:
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5), //Paso 2.4:
               //Paso 2.5:
              Text('Cinemapedia', style: titleStyle?.copyWith(color: colors.primary) ),

               //Paso 2.6:
               IconButton(onPressed: (){

               },
               icon: const Icon(Icons.search)
               )
            ],
          )
        )
      )
    );
  }
}*/

//Paso 3: Se utiliza un Spacer para alinear los elementos.
/*import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      child: Padding(
        padding : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text('Cinemapedia', style: titleStyle?.copyWith(color: colors.primary) ),

              const Spacer(),//Paso 3.1: agregar un Spacer para separar los elementos

               IconButton(onPressed: (){

               },
               icon: const Icon(Icons.search)
               )
            ],
          )
        )
      )
    );
  }
}*/

//Paso 4: Refinamiento del layout con Spacer.
/*import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      child: Padding(
        padding : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text('Cinemapedia', style: titleStyle?.copyWith(color: colors.primary) ),

              const Spacer(),//Paso 4: agregar un Spacer para separar los elementos

               IconButton(onPressed: (){

               },
               icon: const Icon(Icons.search)
               )
            ],
          )
        )
      )
    );
  }
}*/

//Paso 5: Se envuelve en un Container para visualizar el área del AppBar.
/*import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      child: Container(//Paso 5.1: agregar un contenedor
      color: Colors.red,
        child: Padding(
          padding : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.movie_outlined, color: colors.primary),
                const SizedBox(width: 5),
                Text('Cinemapedia', style: titleStyle?.copyWith(color: colors.primary) ),
        
                const Spacer(),
        
                 IconButton(onPressed: (){
        
                 },
                 icon: const Icon(Icons.search)
                 )
              ],
            )
          )
        ),
      )
    );
  }
}*/

//Paso 6: Se ajusta el SafeArea para que no aplique en la parte inferior.
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Container(
      color: Colors.red,
        child: Padding(
          padding : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.movie_outlined, color: colors.primary),
                const SizedBox(width: 5),
                Text('Cinemapedia', style: titleStyle?.copyWith(color: colors.primary) ),
        
                const Spacer(),
        
                 IconButton(onPressed: (){
        
                 },
                 icon: const Icon(Icons.search)
                 )
              ],
            )
          )
        ),
      )
    );
  }
}