//Paso 1: Implementación inicial de la fuente de datos.
// En este paso se define la clase `MoviedbDatasource` que se encargará de obtener las películas
// desde la API de The Movie Database (TMDb). Se configura `dio` para las peticiones HTTP
// y se comienza a implementar el método `getNowPlaying`.

/*import 'package:cinemapedia/config/constants/environment.dart';
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

  //Paso 1.1: Se crea un método privado para centralizar la lógica de mapeo.
  //Este método toma un mapa JSON, lo convierte en un `MovieDbResponse`, y luego
  //mapea cada película a una entidad `Movie`, filtrando las que no tienen póster.
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

    final MovieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = MovieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
        (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
  }
}*/

// Paso 2: Refactorización y adición de nuevos métodos.
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
  // Configuración inicial de Dio para las peticiones a la API de TMDb.
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  // Método privado para convertir la respuesta JSON en una lista de `Movie`.
  List<Movie> _jsonToMovies(Map<String, dynamic> json) {

    // Parsea la respuesta JSON a un objeto `MovieDbResponse`.
    final movieDBResponse = MovieDbResponse.fromJson(json);

    // Mapea la lista de resultados de la API a una lista de entidades `Movie`.
    final List<Movie> movies =
        movieDBResponse.results
            // Filtra las películas que no tienen un póster.
            .where((moviedb) => moviedb.posterPath != 'no-poster') 
            .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
            .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // Realiza la petición GET para obtener las películas en cartelera.
    final response = await dio.get( '/movie/now_playing',
      queryParameters: {
        'page': page
      },
    );

    // Paso 2.1: Se refactoriza el método para usar la función auxiliar `_jsonToMovies`.
    return _jsonToMovies(response.data);
  }

  // Paso 2.2: Implementación del método para obtener películas populares.
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    // Realiza la petición GET para obtener las películas populares.
    final response = await dio.get( '/movie/popular',
      queryParameters: {
        // Se especifica el número de página a solicitar.
        'page': page
      },
    );

    // Reutiliza el método `_jsonToMovies` para procesar la respuesta.
    return _jsonToMovies(response.data);
  }
}