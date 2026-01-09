//Paso 1: Modificamos el showSearch para que inicie con un valor de búsqueda

import 'package:flutter_riverpod/legacy.dart'; // Importamos Riverpod

// Definimos un StateProvider para almacenar el valor de búsqueda inicial
final searchQueryProvider = StateProvider<String>((ref) => '');

//Paso 2: En esta ocasión, probamos con "Batman" como valor inicial de búsqueda

import 'package:flutter_riverpod/legacy.dart'; // Importamos Riverpod

// Agregamos Batman como valor de búsqueda inicial para pruebas
final searchQueryProvider = StateProvider<String>((ref) => 'Batman');