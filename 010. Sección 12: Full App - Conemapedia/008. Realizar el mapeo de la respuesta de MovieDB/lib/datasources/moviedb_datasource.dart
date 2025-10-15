import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/config/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/config/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia/domain/datasourve/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

// Paso 1: Define la estructura inicial del Datasource y la configuración de Dio.
class MoviedbDatasource extends MoviesDatasource{
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3', 
    queryParameters: {
      'api_key': Environment.theMovieDbKey, 
      'language': 'es-MX' 
    } 
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final response = await dio.get('/movie/now_playing');
    
    // Paso 1.1: Parsea la respuesta JSON a un objeto `MovieDbResponse`, pero aún no procesa los resultados.
    final movieDBResponse =  MovieDbResponse.fromJson(response.data);
    
    final  List<Movie> movies = [];

    return movies;
  }
}

// Paso 2: Itera sobre los resultados de la API.
class MoviedbDatasource extends MoviesDatasource{
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3', 
    queryParameters: {
      'api_key': Environment.theMovieDbKey, 
      'language': 'es-MX' 
    } 
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final response = await dio.get('/movie/now_playing');
    
    final movieDBResponse =  MovieDbResponse.fromJson(response.data);
    
    // Paso 2.1: Intenta mapear los resultados, pero devuelve `null` para cada película, resultando en una lista de nulos.
    final  List<Movie> movies = movieDBResponse.results.map(
      (e) => null
    ).toList();

    return movies;
  }
}

// Paso 3: Utiliza el `MovieMapper` para la conversión.
class MoviedbDatasource extends MoviesDatasource{
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3', 
    queryParameters: {
      'api_key': Environment.theMovieDbKey, 
      'language': 'es-MX' 
    } 
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final response = await dio.get('/movie/now_playing');
    
    final movieDBResponse =  MovieDbResponse.fromJson(response.data);
    
    final  List<Movie> movies = movieDBResponse.results.map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb) // Paso 3.1: Mapea cada objeto `MovieMovieDB` a una entidad `Movie`.
    ).toList();

    return movies;
  }
}

// Paso 4: Implementa la lógica final, incluyendo el filtrado de resultados(Código final)
class MoviedbDatasource extends MoviesDatasource{
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3', 
    queryParameters: {
      'api_key': Environment.theMovieDbKey, 
      'language': 'es-MX' 
    } 
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final response = await dio.get('/movie/now_playing');
    
    final movieDBResponse =  MovieDbResponse.fromJson(response.data);
    
    final  List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')// Paso 4.1: Filtra las películas que no tienen un póster.
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb) 
    ).toList();

    return movies;
  }
}