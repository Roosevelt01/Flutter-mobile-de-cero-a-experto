import 'package:cinemapedia/presentation/Views/views.dart';
import 'package:cinemapedia/presentation/screen/movies/home_screen.dart';
import 'package:cinemapedia/presentation/screen/movies/movie_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(
        // Paso 1: Inyectar HomeView dentro de HomeScreen
        childView: HomeView(), ), 
    ),

    GoRoute(
      path: '/movie/:id', 
      name: MovieScreen.name, 
      builder: (context, state){
        final movieId = state.pathParameters['id'] ?? 'no-id'; 

        return MovieScreen(movieId: movieId); 
      },
    ),
  ],
);
