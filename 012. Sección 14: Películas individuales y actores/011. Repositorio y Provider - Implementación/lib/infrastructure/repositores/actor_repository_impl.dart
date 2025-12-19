//Paso 1: Definimos la Clase(ActorRepositoryImpl) y la Herencia(ActorsRepository).
import 'package:cinemapedia/domain/repositories/actors_repository.dart';
class ActorRepositoryImpl extends ActorsRepository {}


//Paso 2:
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  
  //Paso 2.1: 
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
   
    throw UnimplementedError();
  }
}

//Paso 3:
import 'package:cinemapedia/domain/datasourve/actor_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  
  final ActorsDatasource datasource; //Paso 3.1:

  ActorRepositoryImpl(this.datasource); //Paso 3.2:
    

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId); //Paso 3.2:
  
  }
}