// Parte 1: Definición del router principal

import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screen/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen()
    ),

    GoRoute(
      path: '/',
      builder: (context, state) => const ButtonsScreen()
    ),
    
    GoRoute(
      path: '/',
      builder: (context, state) => const CardsScreen()
    )
  ],
);
