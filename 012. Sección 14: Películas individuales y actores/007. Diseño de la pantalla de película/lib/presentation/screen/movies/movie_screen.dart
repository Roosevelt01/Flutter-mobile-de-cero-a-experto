//Paso 1: Modificamos el Scaffold para usar CustomScrollView
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

    if (movie == null){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      //Paso 1.1 Persornalizar el scroll
      body: CustomScrollView( // CustomScrollView para scroll personalizado
        physics: const ClampingScrollPhysics(), // Evita el efecto rebote
        slivers: [
          // Aquí irían los Slivers, como SliverAppBar, SliverList, etc.
        ],
      ),
    );
  }
}

//Paso 2: Crear el CustomSliverAppBar para mostrar la información de la película
import 'package:cinemapedia/domain/entities/movie.dart';
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

    if (movie == null){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView( 
        physics: const ClampingScrollPhysics(), 
        slivers: [
          //Paso 2.2: Usar el CustomSliverAppBar
          _CustomSliverAppBar(movie: movie),
        ],
      ),
    );
  }
}

//Paso 2.1: Crear el CustomSliverAppBar
class _CustomSliverAppBar extends StatelessWidget {
  
  // Creamos una variable movie de tipo Movie para recibir los datos
  final Movie movie; 
  
  const _CustomSliverAppBar({
    required this.movie, // Recibimos los datos en el constructor    
  });

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

//Paso 3: Personalizar el SliverAppBar y usamos el backgroundColor para cambiar el color
import 'package:cinemapedia/domain/entities/movie.dart';
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

    if (movie == null){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView( 
        physics: const ClampingScrollPhysics(), 
        slivers: [
          _CustomSliverAppBar(movie: movie),
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  
  final Movie movie; 
  
  const _CustomSliverAppBar({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    //Paso 3.1: Personalizar el SliverAppBar
    return SliverAppBar(
      backgroundColor: Colors.black,
    );
  }
}

//Paso 4: Agregamos la variable size para usar el 70% de la altura de la pantalla en expandedHeight y cambiamos el color de los íconos y texto con foregroundColor
import 'package:cinemapedia/domain/entities/movie.dart';
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

    if (movie == null){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView( 
        physics: const ClampingScrollPhysics(), 
        slivers: [
          _CustomSliverAppBar(movie: movie),
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  
  final Movie movie; 
  
  const _CustomSliverAppBar({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    //Paso 4.1: Usar el tamaño de la pantalla para el expandedHeight
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7, // Paso 4.2: Usamos el 70% de la altura de la pantalla 
      foregroundColor: Colors.white, // Cambiamos el color de los íconos y texto
    );
  }
}

//Paso 5: Agregar el FlexibleSpaceBar para mostrar el título de la película y la imagen de fondo
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
    final movie = ref.watch(movieInfoProvider)[widget.movieId];

    if (movie == null){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView( 
        physics: const ClampingScrollPhysics(), 
        slivers: [
          _CustomSliverAppBar(movie: movie),
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  
  final Movie movie; 
  
  const _CustomSliverAppBar({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7, 
      foregroundColor: Colors.white, 
      //Paso 5.1: Agregar el FlexibleSpaceBar para mostrar el título de la película
      flexibleSpace: FlexibleSpaceBar(
        titlePadding:  const EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Ajustamos el padding del título

        // Paso 5.2: Mostramos el título de la película
        background: Stack( // Usamos Stack para superponer widgets
          children: [ // Usamos una lista de widgets como hijos del Stack

            SizedBox.expand( // Usamos SizedBox.expand para que ocupe todo el espacio disponible
              child: Image.network( // Mostramos la imagen de la película
                movie.posterPath, // Usamos la ruta del póster de la película
                fit: BoxFit.cover, // Cubrimos todo el espacio disponible
              ),

            ) 
          ],
        ),
      ),

    );
  }
}*/

//Paso 6: Agregar un degradado para mejorar la legibilidad del texto
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
    final movie = ref.watch(movieInfoProvider)[widget.movieId];

    if (movie == null){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView( 
        physics: const ClampingScrollPhysics(), 
        slivers: [
          _CustomSliverAppBar(movie: movie),
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  
  final Movie movie; 
  
  const _CustomSliverAppBar({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7, 
      foregroundColor: Colors.white, 
      flexibleSpace: FlexibleSpaceBar(
        titlePadding:  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

        background: Stack( 
          children: [ 
            SizedBox.expand( 
              child: Image.network( 
                movie.posterPath, 
                fit: BoxFit.cover, 
              ),
            ), 

            //Paso 6.1: Agregar un degradado para mejorar la legibilidad del texto
            const SizedBox.expand(
              child: DecoratedBox( // Usamos DecoratedBox para decorar el fondo
                decoration: BoxDecoration( // Usamos BoxDecoration para definir la decoración
                  gradient: LinearGradient(  // Usamos LinearGradient para crear un degradado lineal
                    begin: Alignment.topCenter, // Comienza en la parte superior
                    end: Alignment.bottomCenter, // Termina en la parte inferior
                    stops: [0.7, 1.0], // Definimos los puntos de parada del degradado, el 0.7 es transparente y el 1.0 es negro
                    colors: [
                      Colors.transparent,
                      Colors.black87,
                    ],
                  ),
                ),
              ),
            ) // finaliza SizedBox.expand

          ],
        ),
      ),

    );
  }
}*/

//Paso 7: Agregar una segunda capa de degradado para mejorar la legibilidad en la parte superior
import 'package:cinemapedia/domain/entities/movie.dart';
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

    if (movie == null){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView( 
        physics: const ClampingScrollPhysics(), 
        slivers: [
          _CustomSliverAppBar(movie: movie),
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  
  final Movie movie; 
  
  const _CustomSliverAppBar({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7, 
      foregroundColor: Colors.white, 
      flexibleSpace: FlexibleSpaceBar(
        titlePadding:  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

        background: Stack( 
          children: [ 
            SizedBox.expand( 
              child: Image.network( 
                movie.posterPath, 
                fit: BoxFit.cover, 
              ),
            ), 
            
            const SizedBox.expand(
              child: DecoratedBox( 
                decoration: BoxDecoration( 
                  gradient: LinearGradient(  
                    begin: Alignment.topCenter, 
                    end: Alignment.bottomCenter, 
                    stops: [0.7, 1.0], 
                    colors: [
                      Colors.transparent,
                      Colors.black87,
                    ],
                  ),
                ),
              ),
            ),

           //Paso 7.1: Agregar una segunda capa de degradado para mejorar la legibilidad en la parte superior
           const SizedBox.expand(
              child: DecoratedBox(  
                decoration: BoxDecoration( 
                  gradient: LinearGradient(  
                    begin: Alignment.topLeft,  
                    stops: [0.0, 0.3],  // Definimos los puntos de parada del degradado, 0.0 es negro y 0.3 es transparente
                    colors: [
                      // El orden es importante 
                      Colors.black87, 
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ) // finaliza SizedBox.expand

          ],
        ),
      ),

    );
  }
}