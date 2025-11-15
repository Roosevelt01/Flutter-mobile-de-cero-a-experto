//Paso 1: Se estructura la pantalla principal y se realiza la carga inicial de datos.
// En esta fase se crea la vista, se cargan las películas "en cines" y "populares"
// al iniciar la pantalla, y se comienza a construir la UI con los widgets correspondientes.
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
    //Paso 1.1: Se llama al provider de películas populares para cargar la primera página de datos.
    ref.read(popularMoviesProvider.notifier).loadNextPage(); 
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    // Paso 1.2: Se obtiene la lista de películas populares desde el provider para poder usarla en la UI.
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
            childCount: 1, 
          ),
        ),
      ],
    );
  }
}

//Paso 2: Se limpia el código y se conectan correctamente los datos y funciones a la lista de "Populares".
// Se eliminan las listas duplicadas y se asegura que el `MovieHorizontalListview` de "Populares" use el provider correcto.
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

                  //Paso 2.1: Se conecta correctamente el widget de la lista horizontal con los datos y la lógica de las películas populares.
                  MovieHorizontalListview(
                    // Se pasa la lista de películas populares obtenida del provider.
                    movies: popularMovies, 
                    // Se establece el título para esta sección de la UI.
                    title: 'Populares', 
                    // Se asigna la función que cargará la siguiente página de películas populares cuando el usuario llegue al final de la lista.
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
}