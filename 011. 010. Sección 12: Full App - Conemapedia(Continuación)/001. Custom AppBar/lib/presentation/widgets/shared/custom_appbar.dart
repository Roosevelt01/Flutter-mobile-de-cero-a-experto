//Paso 1: Estructura básica inicial del AppBar.
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    //Paso 1.1: Se define la estructura base con SafeArea, Padding y Row.
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
}

//Paso 2: Se añaden los elementos visuales como el icono, título y botón de búsqueda.
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    //Paso 2.1: Se obtienen los colores del tema actual.
    final colors = Theme.of(context).colorScheme;

    //Paso 2.2: Se obtiene el estilo de texto del tema actual.
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      child: Padding(
        padding : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
               //Paso 2.3: Icono de la aplicación.
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5), //Paso 2.4: Espacio entre el icono y el texto.
               //Paso 2.5: Título de la aplicación.
              Text('Cinemapedia', style: titleStyle?.copyWith(color: colors.primary) ),

              // Faltan Spacer y Botón
            ],
          )
        )
      )
    );
  }
}

//Paso 3: Se utiliza un Spacer para alinear los elementos.
import 'package:flutter/material.dart';

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

              const Spacer(),//Paso 3.1: Se agrega un Spacer para empujar el botón a la derecha.
            ],
          )
        )
      )
    );
  }
}

//Paso 4: Se envuelve en un Container para visualizar el área del AppBar.
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      child: Container(//Paso 4.1: Se agrega un contenedor para visualizar el área del widget.
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

//Paso 5: Se ajusta el SafeArea para que no aplique en la parte inferior.
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,//Paso 5.1: Se desactiva el SafeArea en la parte inferior.
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