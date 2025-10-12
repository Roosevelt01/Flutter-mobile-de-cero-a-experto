import 'package:cinemapedia/config/router/app_router.dart';
import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter/material.dart';


//Paso 1: Aplicar el Tema en main.dart
void main() {
  runApp(const MainApp());
}

import 'package:cinemapedia/config/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  // ...
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const Scaffold( /* ... */ ), // Temporal
    );
  }
}

//Paso 2: 
void main() {
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