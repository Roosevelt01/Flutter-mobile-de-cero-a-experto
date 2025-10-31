// Paso 1: Define la estructura básica del widget `MovieHorizontalListview`.
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  const MovieHorizontalListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// Paso 2: Define las propiedades que recibirá el widget para hacerlo reutilizable.
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies; // Lista de películas a mostrar
  final String? title; // Título opcional
  final String? subTitle; // Subtítulo opcional
  final VoidCallback? loadNextPage; // Callback para cargar la siguiente página 

  const MovieHorizontalListview({
    super.key, 
    required this.movies, // Hacer que la lista de películas sea obligatoria
    this.title, this.subTitle, // Título y subtítulo opcionales
    this.loadNextPage // Callback opcional
  });

  @override
  Widget build(BuildContext context) {
    return Placeholder(); // Aquí iría la implementación del widget
  }
}

// Paso 3: Establecer la Estructura de Column y SizedBox
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies; 
  final String? title; 
  final String? subTitle; 
  final VoidCallback? loadNextPage; 

  const MovieHorizontalListview({
    super.key, 
    required this.movies, 
    this.title, this.subTitle, 
    this.loadNextPage 
  });

  @override
  Widget build(BuildContext context) {
    //Paso 3.1: Se usa un SizedBox para darle una altura fija y una Column para organizar 
    // verticalmente el título y la futura lista horizontal.
    return SizedBox(
      height: 300,
      child: Column(children: [],)
    ); 
  }
}

// Paso 4: Crear el Widget Interno _Title
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies; 
  final String? title; 
  final String? subTitle; 
  final VoidCallback? loadNextPage; 

  const MovieHorizontalListview({
    super.key, 
    required this.movies, 
    this.title, this.subTitle, 
    this.loadNextPage 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(children: [],)
    ); 
  }
}

// Paso 4.1: Crea un StatelessWidget privado (_Title) para encapsular el diseño del encabezado.
class _Title extends StatelessWidget {
  final String? title; // Título opcional
  final String? subTitle; // Subtítulo opcional
  
  const _Title({super.key, this.title, this.subTitle}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Container(); // Placeholder temporal
  }
}

//Paso 5: 
/*import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies; 
  final String? title; 
  final String? subTitle; 
  final VoidCallback? loadNextPage; 

  const MovieHorizontalListview({
    super.key, 
    required this.movies, 
    this.title, this.subTitle, 
    this.loadNextPage 
  });

  @override
  Widget build(BuildContext context) {
  
    return SizedBox(
      height: 250,
      child: Column(children: [
        //PAso 5.1: 
        if( title != null  || subTitle != null )
          _Title(title!, subTitle: subTitle) // Mostrar el título solo si no es nulo
      ],)
    ); 
  }
}

class _Title extends StatelessWidget {
  final String? title; 
  final String? subTitle;
  
  const _Title({super.key, this.title, this.subTitle}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/

//Paso 6: 
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies; 
  final String? title; 
  final String? subTitle; 
  final VoidCallback? loadNextPage; 

  const MovieHorizontalListview({
    super.key, 
    required this.movies, 
    this.title, this.subTitle, 
    this.loadNextPage 
  });

  @override
  Widget build(BuildContext context) {
    
    // Paso 6.1: Se define la estructura principal del widget.
    return SizedBox(
      height: 250,
      child: Column(children: [
        // Paso 6.2: Se muestra el título y subtítulo si existen.
        if( title != null || subTitle != null )
          _Title( title: title, subTitle: subTitle ) 
      ],)
    ); 
  }
}

// Paso 4: Se crea un widget privado para mostrar el título y subtítulo.
class _Title extends StatelessWidget {
  final String? title; 
  final String? subTitle;
  
  const _Title({ this.title, this.subTitle}); 

  @override
  Widget build(BuildContext context) {
    
    //Paso 6.1:
    // Paso 6.1: Se obtiene el estilo del texto para el título desde el tema de la aplicación.
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only( top: 10),
      margin: const EdgeInsets.symmetric( horizontal: 10),
      child: Row(
        children: [
          // Paso 6.2: Se muestra el título si no es nulo.
          if( title != null )
            Text(title!, style: titleStyle ), //Paso 6.2:       
            Text(title!, style: titleStyle ),       

          const Spacer(),

          // Paso 6.3: Se muestra el subtítulo como un botón si no es nulo.
          if( subTitle != null )
            FilledButton.tonal(
              style: const ButtonStyle( visualDensity: VisualDensity.compact ),
              onPressed: (){}, 
              child: Text( subTitle! )
            )
        ],
      ),
    );
  }
}