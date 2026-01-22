// Reutilizamos el código de HomeView para mostrar la vista de inicio en HomeScreen
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_horizontal_listview.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_slideshow.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_appbar.dart';
import 'package:cinemapedia/presentation/widgets/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
   HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
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

    final initialLoading = ref.watch(InitialRouteListProvider);
    if( initialLoading ) return const FullScreenLoader(); 

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
          title: CustomAppbar(),
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