import 'package:cinemapedia/domain/entities/actor.dart';

//Paso 1: Definición de la interfaz abstracta ActorDatasourve
abstract class ActorsRepository{
  //Paso 1.1: Definición del método para obtener actores por película
  Future<List<Actor>> getActorsByMovie( String movieId );
}

// La clase ActorDatasourve define la interfaz que deben cumplir los proveedores de datos de actores.
// Su función es abstraer la fuente de datos (API, base de datos local, etc.) para obtener información
// relacionada con los actores, como por ejemplo, listar los actores de una película específica.