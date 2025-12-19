//Paso 1: Definimos la Clase(ActorRepositoryImpl) y la Herencia(ActorsRepository).
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

// Al extender, nos obligamos a cumplir el contrato definido en el dominio
class ActorRepositoryImpl extends ActorsRepository {
  // Aún nos falta implementar los métodos, por eso marcará error momentáneo
}

//Paso 2: Inyección de Dependencias (El Constructor)
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  
  final ActorsDatasource datasource; // Pedimos "cualquier" datasource de actores

  ActorRepositoryImpl(this.datasource); // Lo inyectamos al nacer la clase

  // ... Falta el método
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