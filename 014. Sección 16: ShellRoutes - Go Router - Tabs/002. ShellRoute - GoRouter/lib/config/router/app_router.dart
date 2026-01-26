//Paso 1: Se agrega ShellRoute para manejar la navegacion de las pantallas principales
import 'package:cinemapedia/presentation/screen/movies/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    //Paso 1.1:  Dentro del ShellRoute se agrega el HomeScreen como contenedor de las pantallas principales
    ShellRoute(
      // El builder recibe el 'child', que es la vista hija correspondiente a la ruta actual.
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      // Aquí definiremos las rutas hijas...
      routes: [],
    ),
  ],
);

//Paso 2: Iniciamos la configuracion de las rutas hijas dentro del ShellRoute
import 'package:cinemapedia/presentation/Views/home_views/home_view.dart';
import 'package:cinemapedia/presentation/screen/movies/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      //Paso 2.1: Se agregan las rutas hijas dentro del ShellRoute
      routes: [
        //Ruta para la pantalla de inicio
        GoRoute(
          path: '/', // con el path '/' se define la ruta inicial
          builder: (context, state) => const HomeView(), // Se define la vista que se mostrara
        ),
      ],
    ),
  ],
);

//Paso 3: Agregamos la ruta para la pantalla de favoritos
import 'package:cinemapedia/presentation/Views/home_views/favorites_view.dart';
import 'package:cinemapedia/presentation/Views/home_views/home_view.dart';
import 'package:cinemapedia/presentation/screen/movies/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
          path: '/', 
          builder: (context, state) => const HomeView(), 
        ),

        //Paso 3.1: Ruta para la pantalla de favoritos
        GoRoute(
          path: '/', 
          builder: (context, state) => const FavoritesView(), 
        ),

      ],
    ),
  ],
);

//Paso 4: Agregamos la ruta para la pantalla de detalles de la pelicula
import 'package:cinemapedia/presentation/Views/home_views/favorites_view.dart';
import 'package:cinemapedia/presentation/Views/home_views/home_view.dart';
import 'package:cinemapedia/presentation/screen/screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },

      routes: [
        GoRoute(
          path: '/', 
          builder: (context, state) => const HomeView(), 

          //Paso 4.1: Ruta para la pantalla de detalles de la pelicula
          routes: [
            GoRoute( 
              path: 'movie/:id', // Ruta dinamica que recibe el ID de la pelicula
              name: MovieScreen.name, // Nombre de la ruta para facilitar la navegacion
              builder: (context, state) {
                final movieId = state.pathParameters['id'] ?? 'no-id'; // Obtener el ID de los parametros de la ruta
                return MovieScreen(movieId: movieId); // Pasar el ID a la pantalla de detalles
              },
            ),
          ]
        ),
        

        GoRoute(
          path: '/', 
          builder: (context, state) => const FavoritesView(), 
        ),

      ],
    ),
  ],
);             