//Paso 1: Creamos la clase y extendemos de ActorDatasource (el contrato).
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';

// Hereda de ActorDatasource para obligarnos a cumplir las reglas
class ActorMovieDbDatasource extends ActorDatasource {}

//Paso 2: Implementación del método getActorsByMovie.
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorMoviedebDatasource extends ActorDatasourve {
  //Paso 2.1: Definición del método que retornará una lista de actores.
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    // TODO: implement getActorsByMovie
    throw UnimplementedError();
  }
}

//Paso 3: Retorno de una lista vacía temporalmente.
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorMoviedebDatasource extends ActorDatasourve {
  //Paso 3.1: Definición del método.
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    return []; // Retorna una lista vacía mientras se implementa la lógica.
  }
}

//Paso 4: Configuración de Dio para peticiones HTTP.
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';
import 'package:dio/dio.dart';

class ActorMoviedebDatasource extends ActorDatasourve {
  
  //Paso 4.1: Instancia de Dio con la URL base y parámetros globales.
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    return []; 
  }
}

//Paso 5: Realizar la petición HTTP a la API.
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';
import 'package:dio/dio.dart';

class ActorMoviedebDatasource extends ActorDatasourve {
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    
    //Paso 5.1: Petición GET al endpoint de créditos de la película.
    final response = await dio.get('/movie/$movieId/credits');
    

    return []; 
  }
}

//Paso 6: Mapeo de la respuesta JSON a un modelo de datos.
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedebDatasource extends ActorDatasourve {
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    
    final response = await dio.get('/movie/$movieId/credits');
    
    //Paso 6.1: Convierte la respuesta JSON en una instancia de CreditsResponse.
    final castResponse = CreditsResponse.fromJson(response.data)

    return []; 
  }
}

//Paso 7: Conversión final de modelos a entidades y retorno(Código final)
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedebDatasource extends ActorDatasourve {
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    
    final response = await dio.get('/movie/$movieId/credits');
    
    final castResponse = CreditsResponse.fromJson(response.data);

    //Paso 7.1: Mapea la lista de 'cast' del modelo a entidades 'Actor'.
    List<Actor> actors = castResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
    ).toList();

    //Paso 7.2: Retorna la lista de actores lista para usar en la UI.
    return actors; 
  }
}