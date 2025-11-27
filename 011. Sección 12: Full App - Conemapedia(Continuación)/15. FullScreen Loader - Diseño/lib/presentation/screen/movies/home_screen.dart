// Paso 1: Agregamos Placeholder temporalmente
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

     return Placeholder(); // Temporalmente se reemplaza el código por un Placeholder
    
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

// Paso 2: Se reemplaza el Placeholder por el FullScreenLoader(Código final)
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

     return FullScreenLoader(); // Paso 2.1: Se utiliza el FullScreenLoader mientras se carga el contenido
    
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