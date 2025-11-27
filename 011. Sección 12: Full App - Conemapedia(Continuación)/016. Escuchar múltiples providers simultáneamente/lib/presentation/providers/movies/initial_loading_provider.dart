//Paso 1: Crear el provider initial_loading_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart'

final InitialRouteListProvider =  Provider<bool>((ref) {
  // Aquí iría la lógica para determinar si es la primera carga
  return false; // retorna false
});

//Paso 2: Crear el provider initial_loading_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_providers.dart'; // Paso 2.2: Importar los providers de películas

final InitialRouteListProvider =  Provider<bool>((ref) {
  // Paso 2.3: Verificar si alguna de las listas de películas está vacía, el isEmpty devuelve true si la lista está vacía
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final popularMovies = ref.watch(popularMoviesProvider).isEmpty; 
  final topRatedMovies = ref.watch(topRatedMoviesProvider).isEmpty;
  final upComingMovies = ref.watch(upComingMoviesProvider).isEmpty;

  return false;
});

//Paso 3: Cambiamos las variables con step1, step2, step3 y step4. 
//También usaremos if para retornar true si alguna de las listas está vacía(Código final)
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_providers.dart'; 

final InitialRouteListProvider =  Provider<bool>((ref) {
  //Paso 3.1: Cambiamos las variables con step1, step2, step3 y step4.  
  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.watch(popularMoviesProvider).isEmpty; 
  final step3 = ref.watch(topRatedMoviesProvider).isEmpty;
  final step4 = ref.watch(upComingMoviesProvider).isEmpty;

  //Paso 3.2: Usamos if para retornar true si alguna de las listas está vacía
  if (step1 || step2 || step3 || step4) {
    return true;
  }

  return false;
});