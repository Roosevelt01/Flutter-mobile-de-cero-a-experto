import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
       useMaterial3: true, // Utilizar la última especificación de Material Design 3
       brightness: Brightness.dark, // Establecer el tema a oscuro
    );
  }
}