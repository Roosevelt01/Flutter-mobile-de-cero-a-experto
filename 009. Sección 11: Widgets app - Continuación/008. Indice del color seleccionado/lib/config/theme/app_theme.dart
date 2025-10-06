import 'package:flutter/material.dart';

//Paso 1: Se define una lista constante de colores para los temas de la aplicación.
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
  final bool isDarkMode;//Paso 1.1: Propiedad para determinar si el tema oscuro está activado.


  AppTheme({
    this.selectedColor = 1,
    this.isDarkMode = false,//Paso 1.2: Se inicializa `isDarkMode` en `false` por defecto.
  }):assert(selectedColor >= 0, "Selected color must be greater than 0"),
    assert(selectedColor < colorList.length, 
      "Selected color must be less or uqual than ${colorList.length-1}");

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,//Paso 2.2: Se establece el brillo del tema (oscuro o claro) según el valor de `isDarkMode`.
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    ),
  );

}