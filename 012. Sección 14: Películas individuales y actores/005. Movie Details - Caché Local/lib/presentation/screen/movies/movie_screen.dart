//PAso 1: Cambiamos stateless por stateful widget 
/*import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {

  static const String name = 'movie_screen';

  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId, 
  });

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: ${widget.movieId}'), 
      ),
    );
  }
}*/

//Paso 2: Agregamos el metodo initState
import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {

  static const String name = 'movie_screen';

  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId, 
  });

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  //Paso 2.1: Sobrescribimos el metodo initState para inicializar el estado
  void initState() {
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: ${widget.movieId}'), 
      ),
    );
  }
}