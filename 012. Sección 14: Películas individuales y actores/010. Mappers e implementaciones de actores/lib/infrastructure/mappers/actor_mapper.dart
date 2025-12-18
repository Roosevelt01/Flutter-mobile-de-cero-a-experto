//Paso 1: Estructura inicial del mapper para convertir objetos de la API a entidades de dominio.
import 'package:cinemapedia/domain/entities/actor.dart';

class ActorMapper{
  // Definimos el método estático que devolverá un Actor.
  // Aún no recibimos parámetros ni implementamos lógica.
  static Actor castToEntity() =>
    Actor(
      id: id, 
      name: name,
       profilePath: profilePath,
      character: character 
    );
}

//Paso 2: Implementación básica mapeando propiedades directas desde el modelo Cast.
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
class ActorMapper{
  // Recibimos 'Cast' y mapeamos sus campos directos.
  static Actor castToEntity(Cast cast) =>
    Actor(
      id: cast.id, // Se asigna el ID del actor.
      name: cast.name, // Se asigna el nombre del actor.
      profilePath: cast.profilePath, // Se asigna la ruta de la imagen de perfil.
      character: cast.character  // Se asigna el nombre del personaje.
    );
}

//Paso 3: Implementación final con validación de nulos para la imagen.(Códig final)
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
class ActorMapper{
  static Actor castToEntity(Cast cast) =>
    Actor(
      id: cast.id, 
      name: cast.name, 
      //Paso 3.1: Si profilePath es nulo, se usa una imagen por defecto; de lo contrario, se construye la URL completa.
      profilePath: cast.profilePath != null
      ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
      : 'https://cdn.displate.com/artwork/270x380/202', 
      character: cast.character  
    );
}

// La clase ActorMapper convierte objetos de tipo Cast (infraestructura) a entidades Actor (dominio), manejando la lógica de presentación de imágenes