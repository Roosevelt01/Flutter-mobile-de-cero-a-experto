import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.amber,
  Colors.blue,
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
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 1,
    this.isDarkMode = false,
  }):assert(selectedColor >= 0, "Selected color must be greater than 0"),
    assert(selectedColor < colorList.length, 
      "Selected color must be less or uqual than ${colorList.length-1}");

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    ),
  );

  //Paso 1: Este método `copyWith` permite crear una nueva instancia de `AppTheme` basada en la actual,
  //pero con la posibilidad de modificar `selectedColor` o `isDarkMode`. Es útil para la inmutabilidad del estado.
  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode,
  }) => AppTheme( 
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );
}