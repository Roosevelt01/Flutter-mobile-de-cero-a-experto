// Paso 1: Inicialización de la aplicación y carga de variables de entorno.

import 'package:cinemapedia/config/router/app_router.dart';
import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Paso 1.1: Importa el paquete para cargar las variables de entorno.

// Paso 1.2: Configura la función principal para que sea asíncrona.
Future<void> main() async {
  // Paso 1.3: Carga las variables de entorno desde el archivo .env.
  await dotenv.load(fileName: ".env");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}