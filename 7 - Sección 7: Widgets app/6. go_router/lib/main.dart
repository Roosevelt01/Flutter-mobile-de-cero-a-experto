import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Parte 3: Conexión de GoRouter a MaterialApp    
    return MaterialApp.router( // Usamos MaterialApp.router en lugar de MaterialApp
      routerConfig: appRouter, // Asignamos nuestra instancia de GoRouter aquí
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).getTheme(),
    );
  }
}
