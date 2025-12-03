

//PAso 1: Crear la pantalla de peliculas y su estado
import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//Paso 2: Agregar un parametro para el id de la pelicula
import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {

  //Paso 2.1: Definir una constante para el nombre de la pantalla
  static const String name = 'movie_screen';

  //Paso 2.2: Agregar un parametro para el id de la pelicula
  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId, //Paso 2.3: Hacer que el parametro sea requerido
  });

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}