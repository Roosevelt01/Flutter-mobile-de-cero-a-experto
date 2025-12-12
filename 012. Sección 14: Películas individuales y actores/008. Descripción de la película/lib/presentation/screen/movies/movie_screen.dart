//Paso 1: Agregamos SilverList y por consiguiente el widget _MovieDetails
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
          //Paso 1.1: Agregame SliverList para mostrar los detalles
          SliverList( 
            delegate: SliverChildBuilderDelegate( // Usamos delegate que construye los elementos de la lista
              // _MovieDetails es un widget que muestra los detalles de la película y el movie: movie es el 
              //objeto de película que queremos mostrar
              (context, index) =>  _MovieDetails(movie: movie), 
              childCount: 1, // Solo queremos un elemento en la lista
            ),
          )
        ],
      ),
    );

  }
}

//Paso 1.2: Crea el widget _MovieDetails para mostrar los detalles de la película
class _MovieDetails extends StatelessWidget {
  
  final Movie movie; // Recibe un objeto Movie para mostrar sus detalles
  
  const _MovieDetails({
    required this.movie, // Constructor que requiere el objeto Movie
  });

  // Completa el método build para mostrar los detalles de la película
  @override
  Widget build(BuildContext context) {
    return Container();
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

           const SizedBox.expand(
              child: DecoratedBox(  
                decoration: BoxDecoration( 
                  gradient: LinearGradient(  
                    begin: Alignment.topLeft,  
                    stops: [0.0, 0.3],
                    colors: [
                      Colors.black87, 
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ) 

          ],
        ),
      ),

    );
  }
}*/

//Paso 2: Completa el método build de _MovieDetails para mostrar los detalles de la película
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
          SliverList( 
            delegate: SliverChildBuilderDelegate( 
              (context, index) =>  _MovieDetails(movie: movie), 
              childCount: 1, 
            ),
          )
        ],
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  
  final Movie movie; 
  
  const _MovieDetails({
    required this.movie, 
  });

  @override
  Widget build(BuildContext context) {
    // Paso 2.1: Obtén el tamaño de la pantalla
    final size = MediaQuery.of(context).size;
    // Paso 2.2: Obtén el tamaño de la pantalla
    final textStyles = Theme.of(context).textTheme;

    // Paso 2.3: Construye el diseño de los detalles de la película
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos al inicio del eje horizontal
      children: [ // Con Children agregamos múltiples widgets dentro del Column
        Padding(padding:  const EdgeInsets.all(8)), // Agrega un padding alrededor del título
        Placeholder() // Placeholder es un widget que muestra un cuadro gris con una cruz, útil para indicar dónde irá el contenido real más adelante
      ],
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

           const SizedBox.expand(
              child: DecoratedBox(  
                decoration: BoxDecoration( 
                  gradient: LinearGradient(  
                    begin: Alignment.topLeft,  
                    stops: [0.0, 0.3],
                    colors: [
                      Colors.black87, 
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ) 

          ],
        ),
      ),

    );
  }
}

//Paso 3: Completa el diseño de los detalles de la película en _MovieDetails
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
          SliverList( 
            delegate: SliverChildBuilderDelegate( 
              (context, index) =>  _MovieDetails(movie: movie), 
              childCount: 1, 
            ),
          )
        ],
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  
  final Movie movie; 
  
  const _MovieDetails({
    required this.movie, 
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [ 
        Padding(
          padding:  const EdgeInsets.all(8),
          //Paso 3.1: Agrega el Row para contener la imagen y los detalles
          child: Row( 
            crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos al inicio del eje vertical
            children: [
              
              // Paso 3.2: Agrega la imagen del póster de la película
              ClipRRect( 
                borderRadius: BorderRadius.circular(20), // Bordes redondeados para la imagen
                child: Image.network( 
                  movie.posterPath, // URL de la imagen del póster
                  width: size.width * 0.3, // Ancho de la imagen es el 30% del ancho de la pantalla
                ),
              ),
              const SizedBox(width: 10), // Separación
      
              // Columna de textos (siguiente paso)
            ],
          )
        ), 
      ],
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

           const SizedBox.expand(
              child: DecoratedBox(  
                decoration: BoxDecoration( 
                  gradient: LinearGradient(  
                    begin: Alignment.topLeft,  
                    stops: [0.0, 0.3],
                    colors: [
                      Colors.black87, 
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ) 
          ],
        ),
      ),

    );
  }
}

//Paso 4: Agregamos el segundo SizedBox en la clase _MovieDetails
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
          SliverList( 
            delegate: SliverChildBuilderDelegate( 
              (context, index) =>  _MovieDetails(movie: movie), 
              childCount: 1, 
            ),
          )
        ],
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  
  final Movie movie; 
  
  const _MovieDetails({
    required this.movie, 
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [ 
        Padding(
          padding:  const EdgeInsets.all(8),
          child: Row( 
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              
              ClipRRect( 
                borderRadius: BorderRadius.circular(20), 
                child: Image.network( 
                  movie.posterPath, 
                  width: size.width * 0.3, 
                ),
              ),

              const SizedBox(width: 10), // Espacio entre la imagen y los detalles

              //Paso 4.1: Agrega el Column para los detalles de la película
              SizedBox(
                width: (size.width - 40) * 0.7, // Ancho del SizedBox es el 60% del ancho de la pantalla menos el padding
                child: Column(
                  children: [
                    Text(movie.title, style: textStyles.titleLarge), // Título de la película
                    Text(movie.overview), // Descripción de la película
                  ],
                )
              ),
            ],
          )
        ), 

        //Paso 5
        const SizedBox(height: 50)
      ],
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

           const SizedBox.expand(
              child: DecoratedBox(  
                decoration: BoxDecoration( 
                  gradient: LinearGradient(  
                    begin: Alignment.topLeft,  
                    stops: [0.0, 0.3],
                    colors: [
                      Colors.black87, 
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ) 
          ],
        ),
      ),

    );
  }
}


//Paso 5: Mostrar Géneros con Wrap y Chip(Código final)
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
          SliverList( 
            delegate: SliverChildBuilderDelegate( 
              (context, index) =>  _MovieDetails(movie: movie), 
              childCount: 1, 
            ),
          )
        ],
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  
  final Movie movie; 
  
  const _MovieDetails({
    required this.movie, 
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [ 
        Padding(
          padding:  const EdgeInsets.all(8),
          child: Row( 
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              
              ClipRRect( 
                borderRadius: BorderRadius.circular(20), 
                child: Image.network( 
                  movie.posterPath, 
                  width: size.width * 0.3, 
                ),
              ),

              const SizedBox(width: 10), 

              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  children: [
                    Text(movie.title, style: textStyles.titleLarge), 
                    Text(movie.overview),
                  ],
                )
              ),
            ],
          )
        ), 

        //Paso 5.1: Se muestran los géneros de la película.
        Padding(
          padding:const EdgeInsets.all(8), // Añade un espacio de 8 píxeles alrededor del widget Wrap.
          child: Wrap( // Organiza los chips de género, permitiendo que pasen a la siguiente línea si no hay espacio.
            children: [
              ...movie.genreIds.map((gender) => Container(// Itera sobre la lista de géneros de la película para crear un chip por cada uno.
                margin: const EdgeInsets.only(right: 10),// Agrega un margen de 10 píxeles a la derecha de cada chip para separarlos.
                child: Chip( // Widget para mostrar visualmente cada género.
                  label: Text(gender), // Muestra el nombre del género en el chip.
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)), 
                ),
              ))
            ],
          )
        ),
        
        // Espacio adicional al final para mejorar el desplazamiento.
        const SizedBox(height: 50)

      ],
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

           const SizedBox.expand(
              child: DecoratedBox(  
                decoration: BoxDecoration( 
                  gradient: LinearGradient(  
                    begin: Alignment.topLeft,  
                    stops: [0.0, 0.3],
                    colors: [
                      Colors.black87, 
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ) 
          ],
        ),
      ),

    );
  }
}