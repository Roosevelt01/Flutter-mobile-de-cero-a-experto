import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Paso 1: Define la pantalla principal, que es un `StatelessWidget` y contiene la estructura base.
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
    
    // Paso 1.1: Se observan los providers para obtener los datos de las películas.
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider ); // Obtiene la lista completa de películas en cartelera.
    final slideShowMovies = ref.watch( moviesSlideshowProvider ); 

    return Column(
      children: [

        const CustomAppBar(),
        
        MoviesSlideshow( 
          movies: slideShowMovies,
        ),

        // Paso 1.2: Muestra la lista horizontal de películas en cartelera.
        MovieHorizontalListview(
          movies: nowPlayingMovies,
          title: 'En cines',
          subTitle: 'Lunes 20',  
        )

      ],
    );
  }
}