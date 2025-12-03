//Paso 1: Crear la ruta para MovieScreen con un parametro de id
import 'package:cinemapedia/presentation/screen/movies/home_screen.dart';
import 'package:cinemapedia/presentation/screen/movies/movie_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

    //Paso 1.1 Crear la ruta para MovieScreen con un parametro de id
    GoRoute(
      path: '/movie/:id', // Definir la ruta con un parametro de id
      name: MovieScreen.name, 
      builder: (context, state){
        final movieId = state.pathParameters['id'] ?? 'no-id'; // Obtener el id de los parametros de la ruta

        return MovieScreen(movieId: movieId); // Pasar el id al constructor de MovieScreen
      },
    ),
  ],
);
