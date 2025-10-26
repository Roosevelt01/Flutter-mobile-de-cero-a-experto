// Paso 1: Creación de la implementación del repositorio.

/*import 'package:cinemapedia/domain/repositories/movies_repository.dart'; // 1. Importa el contrato (interfaz) del repositorio.

// 1.1. Define la clase que implementa el contrato del repositorio.
class MovieRepositoryImpl implements MoviesRepository {

}*/

// Paso 2: Implementación de los métodos del contrato.
/*import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';  // 2.1. Importaciones necesarias.

class MovieRepositoryImpl implements MoviesRepository{

  // 2.2. Sobrescribe el método getNowPlaying, aún sin implementación.
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    throw UnimplementedError();
  }

}*/

// Paso 3: Inyección de la fuente de datos (Datasource).
/*import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/datasourve/movies_datasource.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';  

class MovieRepositoryImpl implements MoviesRepository{
  final MoviesDatasource datasource; // 3.1. Declara la dependencia a la fuente de datos abstracta.
  MovieRepositoryImpl(this.datasource); // 3.2. Constructor para recibir la fuente de datos.

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    // Aún falta llamar al datasource.
  }

}*/

// Paso 4: Delegación de la llamada al Datasource.
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/datasourve/movies_datasource.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';  

class MovieRepositoryImpl implements MoviesRepository{
  final MoviesDatasource datasource; 
  MovieRepositoryImpl(this.datasource); 

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    // 4.1. Llama al método del datasource para obtener las películas.
    return datasource.getNowPlaying(page: page); 
  }
}
