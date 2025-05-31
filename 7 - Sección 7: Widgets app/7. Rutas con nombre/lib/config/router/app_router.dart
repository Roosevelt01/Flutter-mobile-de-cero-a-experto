import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screen/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,//Paso 2: 
      builder: (context, state) => const HomeScreen()
    ),

    GoRoute(
      path: '/',
      name: ButtonsScreen.name,//Paso 4 
      builder: (context, state) => const ButtonsScreen()
    ),
    
    GoRoute(
      path: '/',
      name: CardsScreen.name,//Paso 6
      builder: (context, state) => const CardsScreen()
    )
  ],
);
