import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
  
  //Paso 1: Se define el método para obtener las películas populares en el datasource.
  Future<List<Movie>> getPopular({int page = 1}); 
}