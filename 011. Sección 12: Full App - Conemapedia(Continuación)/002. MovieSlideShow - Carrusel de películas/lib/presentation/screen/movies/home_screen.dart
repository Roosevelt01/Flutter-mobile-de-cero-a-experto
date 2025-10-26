import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';//Paso 3.1: importar el CustomAppBar
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Pas 1: Borramos el Expanded con el ListView y agregamos el MoviesSlideshow 
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
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    return Column(
      children: [

        const CustomAppBar(),

        MoviesSlideshow( //Paso 3.2: Usar el MoviesSlideshow
          movies: nowPlayingMovies,
        ),
      ],
    );
  }
}

lib
└── presentation
    ├── providers
    │   └── movies
    │       └── movies_providers.dart <-- Leído por HomeScreen
    ├── screen
    │   └── movies
    │       └── home_screen.dart    <-- Modificado
    └── widgets
        ├── movies                  <-- Nuevo Directorio
        │   └── movies_slideshow.dart <-- Foco de la lección
        ├── shared
        │   └── custom_appbar.dart
        └── widgets.dart            <-- Modificado
pubspec.yaml                          <-- Modificado
