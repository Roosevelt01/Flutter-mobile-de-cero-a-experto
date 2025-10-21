
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  static const String name = 'home-screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Paso 1: Muestra la variable de entorno para verificar que se cargó correctamente.
        // Se accede a través de la clase Environment para centralizar el acceso.
        child: Text(Environment.theMovieDbKey),
      ),
    );
  }
}