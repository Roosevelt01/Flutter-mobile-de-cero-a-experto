//Paso 1: Se reemplaza el `Column` por un `SingleChildScrollView` para permitir el scroll cuando el contenido excede la pantalla.
/*import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation()
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final slideShowMovies = ref.watch( moviesSlideshowProvider ); 

    // Paso 1.1: Se envuelve la columna en un `SingleChildScrollView` para hacerla deslizable.
    return SingleChildScrollView(
      child: Column(
        children: [
      
          const CustomAppBar(),

          MoviesSlideshow( 
            movies: slideShowMovies,
          ),
      
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'En cines',
            subTitle: 'Lunes 20',  
            loadNextPage: () => ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage(),
          ),
      
          // Paso 1.2: Se añaden más `MovieHorizontalListview` para simular más contenido y probar el scroll.
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'En cines',
            subTitle: 'Lunes 20',  
            loadNextPage: () => ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage(),
          ),
      
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Próximamente',
            subTitle: 'En este mes',  
            loadNextPage: () => ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage(),
          ),
            
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Populares',
            loadNextPage: () => ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage(),
          ),
      
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Mejor calificadas',
            subTitle: 'Desde siempre',  
            loadNextPage: () => ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage(),
          ),

          const SizedBox( height: 10 ) // Se añade un espacio al final para mejorar la visualización.

        ],
      ),
    );
  }
}*/

//Paso 2: Se reemplaza el `SingleChildScrollView` por un `CustomScrollView` para utilizar slivers.
/*import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    // Paso 2.1: Se reemplaza `SingleChildScrollView` por `CustomScrollView` para poder usar slivers, que ofrecen más control sobre el comportamiento del scroll.
    return CustomScrollView(
      slivers: [
        // Se usan `slivers` en lugar de `children` para construir la vista.

        // Paso 2.2: Se envuelve la `Column` dentro de un `SliverList` para integrarla en el `CustomScrollView`.
        SliverList(
          delegate: SliverChildBuilderDelegate( // El delegate construye los elementos de la lista.
            (context, index) {
              return Column(
                // Ya no se usa child sino slivers
                children: [
                  const CustomAppBar(),

                  MoviesSlideshow(movies: slideShowMovies),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'Lunes 20',
                    loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'Lunes 20',
                    loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Próximamente',
                    subTitle: 'En este mes',
                    loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Populares',
                     loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Mejor calificadas',
                    subTitle: 'Desde siempre',
                    loadNextPage:() => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  const SizedBox(height: 10), // Se añade un espacio al final para mejorar la visualización.
                ],
              );
            },
            childCount: 1, // Se limita a 1 para que la columna se construya una sola vez.
          ),
        ),
      ],
    );
  }
}*/

//Paso 3: Se elimina el `CustomAppBar` para prepararse para un `SliverAppBar`.
/*import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    return CustomScrollView(
      slivers: [

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  
                  // Se comenta el `CustomAppBar` para reemplazarlo por un `SliverAppBar`.
                  //const CustomAppBar(),

                  MoviesSlideshow(movies: slideShowMovies),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'Lunes 20',
                    loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'Lunes 20',
                    loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Próximamente',
                    subTitle: 'En este mes',
                    loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Populares',
                     loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Mejor calificadas',
                    subTitle: 'Desde siempre',
                    loadNextPage:() => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  const SizedBox(height: 10), 
                ],
              );
            },
            childCount: 1, // Se limita a 1 para que la columna se construya una sola vez.
          ),
        ),
      ],
    );
  }
}*/

//Paso 4: Se introduce un `SliverAppBar` básico.
/*import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    return CustomScrollView(
      slivers: [
        
        // Paso 4.1: Se añade un `SliverAppBar` que se integra con el `CustomScrollView`.
        const SliverAppBar(
          floating: true, // Hace que el AppBar aparezca tan pronto como se empieza a hacer scroll hacia arriba.
          title: Text("Hola Mundo"), // Se añade un título temporal para el AppBar.
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [                  

                  MoviesSlideshow(movies: slideShowMovies),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'Lunes 20',
                    loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'Lunes 20',
                    loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Próximamente',
                    subTitle: 'En este mes',
                    loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Populares',
                     loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Mejor calificadas',
                    subTitle: 'Desde siempre',
                    loadNextPage:() => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  const SizedBox(height: 10), 
                ],
              );
            },
            childCount: 1, // Se limita a 1 para que la columna se construya una sola vez.
          ),
        ),
      ],
    );
  }
}*/

//Paso 5: Se configura el `SliverAppBar` para que se comporte como un AppBar flotante y se integra el `CustomAppBar` dentro de él.(Código final)
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    return CustomScrollView(
      slivers: [
        
        const SliverAppBar(
          floating: true, // Permite que el AppBar aparezca al hacer scroll hacia arriba.
          snap: true,// Asegura que el AppBar se muestre o se oculte completamente al interactuar.
          titleSpacing: 0,// Elimina el espaciado por defecto alrededor del título.
          title: CustomAppBar(),// Se utiliza el `CustomAppBar` personalizado como título del `SliverAppBar`.
          ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [                  

                  MoviesSlideshow(movies: slideShowMovies),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'Lunes 20',
                    loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'Lunes 20',
                    loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Próximamente',
                    subTitle: 'En este mes',
                    loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Populares',
                     loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Mejor calificadas',
                    subTitle: 'Desde siempre',
                    loadNextPage:() => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  const SizedBox(height: 10), 
                ],
              );
            },
            childCount: 1, // Se limita a 1 para que la columna se construya una sola vez.
          ),
        ),
      ],
    );
  }
}