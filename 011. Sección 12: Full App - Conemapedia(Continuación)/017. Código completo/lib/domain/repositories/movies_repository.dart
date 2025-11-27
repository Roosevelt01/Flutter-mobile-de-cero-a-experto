import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});
    
  //Paso 1: Se define el contrato para obtener las películas que están por estrenarse.
  Future<List<Movie>> getUpcoming({int page = 1});

  //Paso 2: Se define el contrato para obtener las películas mejor calificadas.
  Future<List<Movie>> getTopRated({int page = 1});
}

// Este archivo define el `MoviesRepository`, una clase abstracta que actúa como un contrato para la obtención de datos de películas. Al definir los métodos que deben existir (`getNowPlaying`, `getPopular`, `getUpcoming`, `getTopRated`), se asegura que cualquier fuente de datos que implemente este repositorio proporcionará las mismas funcionalidades. Esto desacopla la lógica de la aplicación de la implementación específica de la fuente de datos, permitiendo cambiar de proveedor (por ejemplo, de una API a una base de datos local) sin afectar el resto del código.
