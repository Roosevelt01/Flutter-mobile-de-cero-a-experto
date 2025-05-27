// lib/config/theme/app_theme.dart
import 'package:flutter/material.dart';

// Lista de colores predefinidos para la selección de temas.
// Es una constante global, lo que significa que se inicializa una vez
// en tiempo de compilación y no cambia durante la ejecución.
const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];

class AppTheme {

  final int selectedColor;

  // Constructor de la clase AppTheme.
  // Permite inicializar AppTheme con un color seleccionado opcional.
  AppTheme({
    this.selectedColor = 0,
  }):assert(selectedColor > 0, "Selected color must be greater than 0"),
    assert(selectedColor < colorList.length, 
      "Selected color must be less or uqual than ${colorList.length-1}");

  // Método que devuelve un objeto ThemeData configurado con el tema actual.
  // ThemeData es la clase principal de Flutter para definir propiedades de tema.
  ThemeData getTheme() => ThemeData(
    // Habilita el diseño Material 3
    useMaterial3: true,
    // Define el color principal del tema usando el color seleccionado
    colorSchemeSeed: colorList[selectedColor],
  );

}