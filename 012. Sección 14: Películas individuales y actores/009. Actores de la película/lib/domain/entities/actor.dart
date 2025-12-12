
//Paso 1: Definición de la entidad Actor
class Actor{
  final String id;
  final String name;
  final String profilePath;
  final String? character;

  Actor({
    required this.id,
    required this.name,
    required this.profilePath,
    this.character,
  });
}

// La clase Actor representa una entidad fundamental dentro del dominio de la aplicación.
// Su función es encapsular los datos de un actor (como su ID, nombre, foto y personaje) de
// manera agnóstica a la fuente de datos (API), facilitando el uso de esta información en la interfaz de usuario y la lógica de negocio.