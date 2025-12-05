
//Paso 1: Pasamos de StatefulWidget a ConsumerStatefulWidget
/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {

  static const String name = 'movie_screen';

  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId, 
  });

  
  //Paso 1.1: Cambiamos State<MovieScreen> por MovieScreenState  
  
  //Antes de  la modificacion:
  /*@override
  State<MovieScreen> createState() => _MovieScreenState();*/

  //Despues de la modificacion:
  @override
  MovieScreenState createState() => MovieScreenState();
}

//Paso 1.1: Cambiamos State por ConsumerState
class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
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
}*/

//Paso 2: implemetamos ref.read en initState para llamar a loadMovie
/*import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {

  static const String name = 'movie_screen';

  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId, 
  });

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
     //Paso 2.1: Usamos el ref para cargar la pelicula
      ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);

      //Quiero que me redactes que cuando hace clic en una pelicula, llame a loadMovie con el id de la pelicula
      //I/flutter ( 8306): Realizando peticion para http: 1180831
      //W/OnBackInvokedCallback( 8306): OnBackInvokedCallback is not enabled for the application.
      //W/OnBackInvokedCallback( 8306): Set 'android:enableOnBackInvokedCallback="true"' in the application manifest.
      //E/libEGL  ( 8306): called unimplemented OpenGL ES API
      //D/EGL_emulation( 8306): app_time_stats: avg=47.29ms min=10.58ms max=187.62ms count=22

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: ${widget.movieId}'), 
      ),
    );
  }
}*/

//Paso 3: Con la variable movie de tipo Movie? podemos acceder a los datos de la pelicula
/*import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {

  static const String name = 'movie_screen';

  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId, 
  });

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
      ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    //Paso 3.1: creamos una variable movie de tipo Movie? para obtener la pelicula del Map
    // es importante que sea Movie? porque puede ser null si no se ha cargado aun
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];

    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: ${widget.movieId}'), 
      ),
    );
  }
}*/

//Paso 4: Con la variable movie de tipo Movie? podemos acceder a los datos de la pelicula
/*import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {

  static const String name = 'movie_screen';

  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId, 
  });

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
      ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    //Paso 3.1: creamos una variable movie de tipo Movie? para obtener la pelicula del Map
    // es importante que sea Movie? porque puede ser null si no se ha cargado aun
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];

    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: ${widget.movieId}'), 
      ),
    );
  }
}*/

//Paso 5: Mostramos un CircularProgressIndicator mientras se carga la pelicula(Código final)
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {

  static const String name = 'movie_screen';

  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId, 
  });

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
      ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final movie = ref.watch(movieInfoProvider)[widget.movieId];

    //Paso 5.1: Mostramos un CircularProgressIndicator mientras se carga la pelicula
    if (movie == null){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: ${widget.movieId}'), 
      ),
    );
  }
}
