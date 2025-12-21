//Paso 1: Creamos el esquelet del widget _actorsByMovie
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
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
      ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId); 
      
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

        Padding(
          padding:const EdgeInsets.all(8),
          child: Wrap( 
            children: [
              ...movie.genreIds.map((gender) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: Chip( 
                  label: Text(gender), 
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)), 
                ),
              ))
            ],
          )
        ),
             
        const SizedBox(height: 50)

      ],
    );
  }
}

//Paso 1.1: Definir el Widget _ActorsByMovie (Estructura Básica)
class _ActorsByMovie extends StatelessWidget { // Cambiamos a ConsumerWidget para usar Riverpod
  
  final String movieId; // Paso crítico: Definirlo como String, no int.
  
  const _ActorsByMovie({
    required this.movieId, 
  });
  
  @override
  // Al ser ConsumerWidget, necesitamos recibir 'ref' en el build
  Widget build(BuildContext context) {
    return const Placeholder(); // Retorno temporal
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

//Paso 2: Pasamos el ID convertido a String para que coincida con la clave del Map en el Provider
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
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
      ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId); 
      
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

        Padding(
          padding:const EdgeInsets.all(8),
          child: Wrap( 
            children: [
              ...movie.genreIds.map((gender) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: Chip( 
                  label: Text(gender), 
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)), 
                ),
              ))
            ],
          )
        ),
             
        //Paso 2.1: Integración en _MovieDetails
        _ActorsByMovie(movieId: movie.id.toString()), 
        
        const SizedBox(height: 50)

      ],
    );
  }
}

class _ActorsByMovie extends ConsumerWidget {
  
  final String movieId; 
  
  const _ActorsByMovie({
    required this.movieId, 
  });
  
  @override
  Widget build(BuildContext context, ref) { 
    return const Placeholder();
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

//Paso 3: Conectamos los datos con Riverpod
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
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
      ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId); 
      
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

        Padding(
          padding:const EdgeInsets.all(8),
          child: Wrap( 
            children: [
              ...movie.genreIds.map((gender) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: Chip( 
                  label: Text(gender), 
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)), 
                ),
              ))
            ],
          )
        ),
             
        _ActorsByMovie(movieId: movie.id.toString()), 
        const SizedBox(height: 50)

      ],
    );
  }
}

class _ActorsByMovie extends ConsumerWidget {
  
  final String movieId; 
  
  const _ActorsByMovie({
    required this.movieId, 
  });
  
  @override
  Widget build(BuildContext context, ref) { 

    //Paso 3.1: Escuchamos el provider completo (Mapa de actores)
    final actorsByMovie = ref.watch(actorsByMovieProvider);

    //Paso 3.2: Verificamos si ya existen datos para esta película específica.
    // Si es null, significa que se está realizando la petición HTTP.
    if( actorsByMovie[movieId] == null){
      return const CircularProgressIndicator(strokeWidth: 2);
    }

    //Paso 3.3: Si no es null, obtenemos la lista segura de actores (!)
    final actors = actorsByMovie[movieId]!;

    return const Placeholder();
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

//Paso 4: Construismos la estructura del carrusel
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
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
      ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId); 
      
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

        Padding(
          padding:const EdgeInsets.all(8),
          child: Wrap( 
            children: [
              ...movie.genreIds.map((gender) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: Chip( 
                  label: Text(gender), 
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)), 
                ),
              ))
            ],
          )
        ),
             
        _ActorsByMovie(movieId: movie.id.toString()), 
        const SizedBox(height: 50)

      ],
    );
  }
}

class _ActorsByMovie extends ConsumerWidget {
  
  final String movieId; 
  
  const _ActorsByMovie({
    required this.movieId, 
  });
  
  @override
  Widget build(BuildContext context, ref) { 

    final actorsByMovie = ref.watch(actorsByMovieProvider);

    if( actorsByMovie[movieId] == null){
      return const CircularProgressIndicator(strokeWidth: 2);
    }

    final actors = actorsByMovie[movieId]!;

    //Paso 4.1: Configurar el ListView Horizontal
    return SizedBox(
      height: 300, // Altura fija del carrusel 
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Desplazamiento lateral
        itemCount: actors.length, // Cantidad de actores a renderizar
        itemBuilder: (context, index) {
          final actor = actors[index]; // agrega comentario
          
          // Retornamos el diseño de cada actor individual
          return Container(
            padding: const EdgeInsets.all(8), // Espacio entre items
            width: 135,  // Ancho fijo de cada tarjeta de actor
            child: Column(
              children: [
                // Ancho fijo de cada tarjeta de actor
              ]   
            ) // Cierre de Column
          ); // Cierre de Container

        } // Cierre de itemBuilder

      ),// cierre de ListView.builder

    ); //Cierre de SizedBox
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

//Paso 5: Renderizar la Foto (ClipRRect)
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
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
      ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId); 
      
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

        Padding(
          padding:const EdgeInsets.all(8),
          child: Wrap( 
            children: [
              ...movie.genreIds.map((gender) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: Chip( 
                  label: Text(gender), 
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)), 
                ),
              ))
            ],
          )
        ),
             
        _ActorsByMovie(movieId: movie.id.toString()), 
        const SizedBox(height: 50)

      ],
    );
  }
}

class _ActorsByMovie extends ConsumerWidget {
  
  final String movieId; 
  
  const _ActorsByMovie({
    required this.movieId, 
  });
  
  @override
  Widget build(BuildContext context, ref) { 

    final actorsByMovie = ref.watch(actorsByMovieProvider);

    if( actorsByMovie[movieId] == null){
      return const CircularProgressIndicator(strokeWidth: 2);
    }

    final actors = actorsByMovie[movieId]!;

    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: actors.length, 
        itemBuilder: (context, index) {
          final actor = actors[index]; 
          
          return Container(
            padding: const EdgeInsets.all(8),
            width: 135,
            child: Column(
              children: [
                
                //Paso 5.1: Damos vida al carrusel con las imágenes
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                  child: Image.network(
                    actor.profilePath, // URL (Ya validada en el Mapper)
                    height: 180,  
                    width: 135,  
                    fit: BoxFit.cover, // La imagen cubre todo el espacio disponible
                  ), // Cierre de Image.network
                
                ), // Cierre de ClipRRect

              ]   
            )
          ); 
        } 
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

//Paso 6: Renderizar Nombre y Personaje
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
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
      ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId); 
      
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

        Padding(
          padding:const EdgeInsets.all(8),
          child: Wrap( 
            children: [
              ...movie.genreIds.map((gender) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: Chip( 
                  label: Text(gender), 
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)), 
                ),
              ))
            ],
          )
        ),
             
        _ActorsByMovie(movieId: movie.id.toString()), 
        const SizedBox(height: 50)

      ],
    );
  }
}

class _ActorsByMovie extends ConsumerWidget {
  
  final String movieId; 
  
  const _ActorsByMovie({
    required this.movieId, 
  });
  
  @override
  Widget build(BuildContext context, ref) { 

    final actorsByMovie = ref.watch(actorsByMovieProvider);

    if( actorsByMovie[movieId] == null){
      return const CircularProgressIndicator(strokeWidth: 2);
    }

    final actors = actorsByMovie[movieId]!;

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, 
        itemCount: actors.length, 
        itemBuilder: (context, index) {
          final actor = actors[index]; 
          
          return Container(
            padding: const EdgeInsets.all(8),
            width: 135,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Paso 8.1:
              children: [
                
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    actor.profilePath, 
                    height: 180,  
                    width: 135,  
                    fit: BoxFit.cover,  
                  ),
                ), 

                const SizedBox(height: 5), // Separación pequeña
                
                // Paso 6.1: Añadimos los toques finales de texto
                
                // Nombre del Actor
                Text(
                  actor.name,
                  maxLines: 2 // Máximo 2 líneas para el nombre real
                ),

                // Nombre del Personaje (Papel)
                Text(actor.character ?? '', // Puede ser null, usamos string vacío por defecto
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, // Negrita para resaltar el personaje
                    overflow: TextOverflow.ellipsis, // Si es muy largo, muestra "..."
                  ),
                ), 

              ]   
            )          
          ); 
        } 
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