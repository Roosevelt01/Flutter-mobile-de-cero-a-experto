import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Paso 1: Define la pantalla principal de la aplicación.
class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _HomeView());
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
    // Se obtiene la lista de películas optimizada para el slideshow desde el provider.
    // Paso 1.1: Observa el provider que expone las películas para el slideshow.
    final nowPlayingMovies = ref.watch( moviesSlideshowProvider );

    return Column(
      children: [

        const CustomAppBar(),

        MoviesSlideshow( 
          movies: nowPlayingMovies,
        ),
      ],
    );
  }
}