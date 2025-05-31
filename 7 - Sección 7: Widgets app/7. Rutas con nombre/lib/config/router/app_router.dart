import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screen/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      // Paso 4: Asigna el nombre estático a la ruta de inicio
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()
    ),

    GoRoute(
      path: '/',
      // Paso 5: Asigna el nombre estático a la ruta de botones
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen()
    ),
    
    GoRoute(
      path: '/',
      // Paso 6: Asigna el nombre estático a la ruta de tarjetas
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen()
    )
  ],
);
