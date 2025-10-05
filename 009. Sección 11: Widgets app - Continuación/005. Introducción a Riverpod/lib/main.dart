
//Paso 1: Configuración inicial para integrar Riverpod en la aplicación.
import 'package:flutter/material.dart';
//Paso 1.1: Importamos el paquete de flutter_riverpod para la gestión de estado.
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
void main() { 
  runApp(
    //Paso 2.2: El `ProviderScope` es un widget que almacena el estado de nuestros providers.
    //Es necesario envolver toda la aplicación con él para que Riverpod funcione.
    const ProviderScope(
      child: MainApp(),
    ),
  );
} 

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).getTheme(),
    );
  }
}
