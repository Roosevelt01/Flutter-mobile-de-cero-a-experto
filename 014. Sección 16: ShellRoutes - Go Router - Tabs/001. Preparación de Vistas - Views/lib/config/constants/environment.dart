import 'package:flutter_dotenv/flutter_dotenv.dart';

// Paso 1: Define una clase para centralizar el acceso a las variables de entorno.
class Environment {
  // Paso 1.1: Expone la API Key de The Movie DB.
  // Lee el valor de la variable 'THE_MOVIEDB_KEY' del archivo .env.
  // Si no la encuentra, utiliza un valor predeterminado para indicar el error.
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay api key';
}