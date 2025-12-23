import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
  
  Future<List<Movie>> getPopular({int page = 1}); 

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});

  //Agregamos getMovieById para obtener los detalles de una pelicula por su ID
  Future<Movie> getMovieById(String id);
  
}

//Agrega comentario explicativo sobre getMovieById