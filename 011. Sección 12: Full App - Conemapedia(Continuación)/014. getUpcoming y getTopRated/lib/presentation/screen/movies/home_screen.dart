//Paso 1: Se realiza la carga inicial de datos para las nuevas categorías.
// En este paso, se añaden las llamadas en `initState` para que, al iniciar la pantalla,
// se dispare la carga de la primera página de películas para "próximamente" y "mejor calificadas".
/* import 'package:cinemapedia/presentation/providers/providers.dart';
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
    ref.read(popularMoviesProvider.notifier).loadNextPage(); 
    //Paso 1.1: Se llama al método `loadNextPage` del provider de películas "próximamente" para cargar los datos iniciales.
    ref.read(upComingMoviesProvider.notifier).loadNextPage(); 
    //Paso 1.2: Se llama al método `loadNextPage` del provider de películas "mejor calificadas" para cargar los datos iniciales.
    ref.read(topRatedMoviesProvider.notifier).loadNextPage(); 
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider); 

    return CustomScrollView(
      slivers: [
        
        const SliverAppBar(
          floating: true, 
          snap: true,
          titleSpacing: 0,
          title: CustomAppBar(),
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
                    title: 'Próximamente',
                    subTitle: 'En este mes',
                    loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: popularMovies, 
                    title: 'Populares', 
                     loadNextPage:() =>ref.read(popularMoviesProvider.notifier).loadNextPage(), 
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
            childCount: 1, 
          ),
        ),
      ],
    );
  }
}*/

//Paso 2: Se obtienen los datos de los nuevos providers.
// Aquí, se utiliza `ref.watch` para suscribirse a los providers `topRatedMoviesProvider` y
// `upComingMoviesProvider`. Esto permite que el widget se reconstruya cuando los datos de estas
// listas de películas cambien.
/* import 'package:cinemapedia/presentation/providers/providers.dart';
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
    ref.read(popularMoviesProvider.notifier).loadNextPage(); 
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider); 
    //Paso 2.1: Se obtiene la lista de películas "mejor calificadas" del provider correspondiente.
    final topRatedMovies = ref.watch(topRatedMoviesProvider); 
    //Paso 2.2: Se obtiene la lista de películas "próximamente" del provider correspondiente.
    final upComingMovies = ref.watch(upComingMoviesProvider); 

    return CustomScrollView(
      slivers: [
        
        const SliverAppBar(
          floating: true, 
          snap: true,
          titleSpacing: 0,
          title: CustomAppBar(),
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
                    title: 'Próximamente',
                    subTitle: 'En este mes',
                    loadNextPage:() =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: popularMovies, 
                    title: 'Populares', 
                     loadNextPage:() =>ref.read(popularMoviesProvider.notifier).loadNextPage(), 
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
            childCount: 1, 
          ),
        ),
      ],
    );
  }
}*/

//Paso 3: Se conectan los datos y funciones a la interfaz de usuario.
// Este es el paso final donde se actualizan los widgets `MovieHorizontalListview` para que
// muestren las listas de películas correctas ("próximamente" y "mejor calificadas") y se les asigna su respectiva función `loadNextPage`.
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
    ref.read(popularMoviesProvider.notifier).loadNextPage(); 
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider); 
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);

    return CustomScrollView(
      slivers: [
        
        const SliverAppBar(
          floating: true, 
          snap: true,
          titleSpacing: 0,
          title: CustomAppBar(),
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

                  //Paso 3.1: Se configura el widget para mostrar la lista de próximos estrenos.
                  MovieHorizontalListview(
                    movies: upComingMovies, 
                    title: 'Próximamente',
                    subTitle: 'En este mes',
                    loadNextPage:() =>ref.read(upComingMoviesProvider.notifier).loadNextPage(), 
                  ),

                  MovieHorizontalListview(
                    movies: popularMovies, 
                    title: 'Populares', 
                     loadNextPage:() =>ref.read(popularMoviesProvider.notifier).loadNextPage(), 
                  ),

                  //Paso 3.2: Se configura el widget para mostrar la lista de las películas mejor calificadas.
                  MovieHorizontalListview(
                    movies: topRatedMovies, 
                    title: 'Mejor calificadas',
                    subTitle: 'Desde siempre',
                    loadNextPage:() => ref.read(topRatedMoviesProvider.notifier).loadNextPage(), 
                  ),

                  const SizedBox(height: 10), 
                ],
              );
            },
            childCount: 1, 
          ),
        ),
      ],
    );
  }
}

// Este archivo define la pantalla principal de la aplicación. Utiliza un `ConsumerStatefulWidget` para poder acceder a los providers de Riverpod y manejar el estado. En el `initState` se realiza la carga inicial de datos para todas las categorías de películas. El `build` método construye la interfaz de usuario utilizando un `CustomScrollView` para un desplazamiento eficiente y delega la construcción de las listas horizontales de películas al widget reutilizable `MovieHorizontalListview`, al cual se le suministran los datos y las funciones de carga correspondientes de cada provider.