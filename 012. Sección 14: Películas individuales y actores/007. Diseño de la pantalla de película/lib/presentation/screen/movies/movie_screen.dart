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

//Paso 2: Modificamos el Scaffold para usar CustomScrollView
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
          _CustomSliverAppBar(movie:movie) // Paso 2.1: Llamamos a nuestro SliverAppBar personalizado. Es el primer elemento de la lista de slivers.
        ],
      ),
    );
  }
}

// Paso 2.2: Creamos el widget privado _CustomSliverAppBar
// Este widget se encargará de mostrar la imagen y el título en la parte superior con efectos de scroll.
class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomSliverAppBar({ required this.movie });

  @override
  Widget build(BuildContext context) {
    // Paso 2.3: Retornamos el SliverAppBar configurado
    // El SliverAppBar es el componente que permite que la barra se expanda o contraiga al hacer scroll.
    return SliverAppBar(
      backgroundColor: Colors.black,
    );
  }
}

//Paso 3: Modificamos el Scaffold para usar CustomScrollView
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
          _CustomSliverAppBar(movie:movie) 
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomSliverAppBar({ required this.movie });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; //Paso 3.1: Obtenemos las dimensiones del dispositivo.
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7, // Determina la altura del AppBar (70% de la pantalla) al estar expandido.
      foregroundColor: Colors.white, // Asegura que los iconos (como el botón de atrás) sean blancos para contrastar.
    );
  }
}

//Paso 4: Configuramos el contenido visual (imagen) dentro del SliverAppBar
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
          _CustomSliverAppBar(movie:movie) 
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomSliverAppBar({ required this.movie });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; 
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7, 
      foregroundColor: Colors.white,
      //Paso 4.1: Usamos flexibleSpace para definir el widget que se estira/contrae. 
      flexibleSpace: FlexibleSpaceBar(        
        //Paso 4.2: Usamos un Stack en el background para poder apilar la imagen y luego los gradientes.
        background: Stack(

        // Usamos un Stack porque vamos a apilar capas:
        // a. Imagen (Fondo)
        // b. Gradiente Inferior (Sombra Texto)
        // c. Gradiente Superior (Sombra Botones)

          children: [
          ],
        )
      ),
    );
  }
}

// Paso 5: Añadimos la imagen de fondo al SliverAppBar
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
          _CustomSliverAppBar(movie:movie) 
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomSliverAppBar({ required this.movie });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; 
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7, 
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [

            // Paso 5.1: Usamos SizedBox.expand para que la imagen ocupe todo el espacio del Stack.
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,  // La URL desde donde se carga la imagen del póster.
                fit: BoxFit.cover, // Escala la imagen para cubrir todo el contenedor sin deformarla.
              ),// Cierre de SizedBox.expand
            ),//Cierre de SizedBox.expand

          ],
        )
      ),
    );
  }
}

// Paso 6: Agregamos el gradiente (sombra) inferior
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
          _CustomSliverAppBar(movie:movie) 
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomSliverAppBar({ required this.movie });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; 
    
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7, 
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,  
                fit: BoxFit.cover, 
              ),
            ),

            // Paso 6.1: Añadimos un gradiente inferior para mejorar la legibilidad del texto blanco sobre la imagen.
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration( // Define el estilo de la caja.
                  gradient: LinearGradient( // Crea una transición de colores lineal.
                    begin: Alignment.topCenter, // El gradiente comienza desde arriba (parte transparente).
                    end: Alignment.bottomCenter, // Termina abajo (parte oscura).
                    stops: [0.7, 1.0], // Puntos de parada: del 0% al 70% es transparente, del 70% al 100% se oscurece.
                    colors: [ // Los colores usados en la transición.
                      Colors.transparent, // Color inicial (invisible) para ver la imagen.
                      Colors.black87      // Color final (oscuro) para el fondo del texto.
                    ]
                  )
                )
              )
            ),

          ],
        )
      ),
    );
  }
}

// Paso 6: Agregamos el gradiente (sombra) inferior
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
          _CustomSliverAppBar(movie:movie) 
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomSliverAppBar({ required this.movie });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; 
    
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7, 
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
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
                      Colors.black87      
                    ]
                  )
                )
              )
            ),
          ],
        )
      ),
    );
  }
}

// Paso 7: Agregamos el gradiente superior para la flecha de retroceso(Código final)
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
          _CustomSliverAppBar(movie:movie) 
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomSliverAppBar({ required this.movie });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; 
    
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7, 
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
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
                      Colors.black87      
                    ]
                  )
                )
              )
            ),

            //Paso 7.1: 
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration( 
                  gradient: LinearGradient( 
                    begin: Alignment.topLeft, //Empieza desde la izquierda
                    // El gradiente empieza en el 0% (borde superior) y termina de difuminarse al 30% de la pantalla.
                    stops: [0.0, 0.3], 
                    colors: [ 
                      // 1. Colors.black87: Inicio (TopLeft).
                      //    Oscuridad máxima en la esquina para resaltar el botón de regresar.
                      Colors.black87,
                      
                      // 2. Colors.transparent: Fin.
                      //    Se vuelve transparente rápidamente hacia el centro.
                      Colors.transparent,
                    ]
                  )
                )
              )
            ), //Cierre del segundo SizedBox.expand
          ],
        )
      ),
    );
  }
}