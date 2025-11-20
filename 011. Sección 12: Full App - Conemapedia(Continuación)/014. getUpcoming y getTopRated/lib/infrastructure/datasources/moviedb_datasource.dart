// Paso 1: Refactorización y adición de nuevos métodos.
// Se introduce un método privado `_jsonToMovies` para reutilizar la lógica de transformación
// de la respuesta JSON a una lista de entidades `Movie`. Esto simplifica los métodos `getNowPlaying`
// y `getPopular`, evitando la duplicación de código.(Código final)
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia/domain/datasourve/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {

    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies =
        movieDBResponse.results
            .where((moviedb) => moviedb.posterPath != 'no-poster') 
            .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
            .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get( '/movie/now_playing',
      queryParameters: {
        'page': page
      },
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get( '/movie/popular',
      queryParameters: {
        'page': page
      },
    );

    return _jsonToMovies(response.data);
  }

  //Paso 1.1: Se implementa el método para obtener las películas mejor calificadas, cumpliendo con el contrato de MoviesDatasource.
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    // Se realiza una petición GET al endpoint 'top_rated' de la API para obtener las películas mejor calificadas.
    final response = await dio.get( '/movie/top_rated', 
      queryParameters: {
        'page': page
      },
    );

    return _jsonToMovies(response.data);
  }

  //Paso 1.2: Se implementa el método para obtener los próximos estrenos, cumpliendo con el contrato de MoviesDatasource.
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    // Se realiza una petición GET al endpoint 'upcoming' de la API para obtener los próximos estrenos.
    final response = await dio.get( '/movie/upcoming', 
      queryParameters: {
        'page': page
      },
    );

    return _jsonToMovies(response.data);
  }
}

// Este archivo contiene la implementación concreta de `MoviesDatasource` utilizando la API de The Movie Database (TMDb). 
//La clase `MoviedbDatasource` utiliza el paquete `dio` para realizar las peticiones HTTP a los diferentes endpoints de la 
//API (`/now_playing`, `/popular`, `/top_rated`, `/upcoming`). Incluye un método privado `_jsonToMovies` que centraliza la 
//lógica para transformar la respuesta JSON de la API en una lista de entidades `Movie`, evitando la duplicación de código y 
//asegurando que todas las películas pasen por el mismo proceso de mapeo y filtrado.