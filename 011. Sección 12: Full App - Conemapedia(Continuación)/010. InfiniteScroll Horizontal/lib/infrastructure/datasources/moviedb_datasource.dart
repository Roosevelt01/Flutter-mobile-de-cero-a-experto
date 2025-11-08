import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/config/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/config/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia/domain/datasourve/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

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
    final response = await dio.get('/movie/now_playing', 
      //Paso 1: Se añaden los parámetros de consulta a la petición, como el número de página.
      queryParameters: {
        'page': page
      }
    );
    
    final movieDBResponse =  MovieDbResponse.fromJson(response.data);
    
    final  List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb) 
    ).toList();

    return movies;
  }
}