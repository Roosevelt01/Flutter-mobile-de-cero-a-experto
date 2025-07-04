import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/screen/burrons/buttons_screen.dart';
import 'package:widgets_app/presentation/screen/cards/card_scren.dart';
import 'package:widgets_app/presentation/screen/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).getTheme(),
      home: const HomeScreen(),
      // Paso 4: Definición de rutas nombradas
      routes: {
        // Ruta para la pantalla de botones
        'buttons': (context) => const ButtonsScreen(),
        // Ruta para la pantalla de tarjetas
        'cards': (context) => const CardsScreen(),
      }
    );
  }
}
