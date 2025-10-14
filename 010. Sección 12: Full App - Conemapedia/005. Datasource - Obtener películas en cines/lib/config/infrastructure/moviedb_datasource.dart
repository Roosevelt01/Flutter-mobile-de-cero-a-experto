
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasourve/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

// Paso 1: Creación de la clase que implementa el datasource abstracto.
class MoviedbDatasource extends MoviesDatasource{

}

// Paso 2: Implementación del método `getNowPlaying` requerido por la clase abstracta.
class MoviedbDatasource extends MoviesDatasource{
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    // Aún falta la lógica asíncrona y el retorno.
    throw UnimplementedError(); // Placeholder que arroja un error si se llama.
  }
}

// Paso 3: Conversión del método a asíncrono y retorno de una lista vacía.
class MoviedbDatasource extends MoviesDatasource{
  
  // Se convierte el método en asíncrono.
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
  
    // Se retorna una lista vacía temporalmente.
    return [];
  }
}

// Paso 4: Configuración inicial de Dio para las peticiones HTTP.
class MoviedbDatasource extends MoviesDatasource{
  
  // Se crea una instancia de Dio con la URL base de la API.
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    return [];
  }
}

// Paso 5: Añadir parámetros de consulta por defecto a Dio.
class MoviedbDatasource extends MoviesDatasource{
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey, // Clave de la API.
      'language': 'es-MX' // Idioma de las respuestas.
    } 
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    return [];
  }
}

//Paso 6: Implementación final del Datasource con una llamada real a la API(Código final)
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
    // Realiza la petición GET al endpoint de películas en cartelera.
    final response = await dio.get('/movie/now_playing');
    final  List<Movie> movies = [];
    
    // Retorna la lista de películas.
    return movies;
  }
}