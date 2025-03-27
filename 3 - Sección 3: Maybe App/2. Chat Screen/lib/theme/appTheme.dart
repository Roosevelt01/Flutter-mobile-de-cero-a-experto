import 'package:flutter/material.dart';


const List<Color> _colorThemes = [
  Colors.purple,    // Índice 0
  Colors.blue,      // Índice 1
  Colors.teal,      // Índice 2
  Colors.green,     // Índice 3
  Colors.yellow,    // Índice 4
  Colors.orange,    // Índice 5  
  Colors.pink,      // Índice 6
];

class AppTheme {
  final int selectedColor; // Índice del color seleccionado

  // [SE APLICÓ] Constructor con valor por defecto y validaciones
  AppTheme({this.selectedColor = 0})
    : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,  
      'Colors must be between 0 and ${_colorThemes.length - 1}');

  // [SE APLICÓ] Método que construye el ThemeData configurado
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,       // Habilita Material Design 3
      colorSchemeSeed: _colorThemes[selectedColor], // Color base del tema
      brightness: Brightness.dark // Configura tema oscuro
    );
  }
}