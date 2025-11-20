

import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
  
  Future<List<Movie>> getPopular({int page = 1}); 

  //Paso 1: Se define el contrato para obtener las películas que están por estrenarse.
  Future<List<Movie>> getUpcoming({int page = 1});

  //Paso 2: Se define el contrato para obtener las películas mejor calificadas.
  Future<List<Movie>> getTopRated({int page = 1});

}

// Este archivo define la clase abstracta `MoviesDatasource`, que actúa como un contrato o interfaz
// para las fuentes de datos de películas. Al declarar los métodos que deben ser 
// implementados (`getNowPlaying`, `getPopular`, `getUpcoming`, `getTopRated`), se asegura que cualquier
// clase que implemente `MoviesDatasource` proporcionará una forma estandarizada de obtener estos diferentes
// tipos de listas de películas. Esto es fundamental para la arquitectura limpia, ya que desacopla el dominio 
//de la aplicación de las implementaciones concretas de dónde y cómo se obtienen los datos (por ejemplo, una API, una base de datos local, etc.).