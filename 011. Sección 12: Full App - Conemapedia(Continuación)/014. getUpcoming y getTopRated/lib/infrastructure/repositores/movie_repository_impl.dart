// Paso 1: Se crea la implementación del repositorio de películas.
// Esta clase actúa como un intermediario entre el dominio de la aplicación (lo que la app necesita)
// y las fuentes de datos (de dónde vienen los datos).
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/datasourve/movies_datasource.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';  

class MovieRepositoryImpl implements MoviesRepository{
  final MoviesDatasource datasource; 
  MovieRepositoryImpl(this.datasource); 

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page); 
  }
  
  //Paso 1.1: Se implementa el método para obtener las películas populares.
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    // Llama al método getPopular del datasource para obtener los datos.
    // El repositorio no sabe de dónde vienen los datos (API, base de datos, etc.),
    // simplemente delega la llamada a la fuente de datos.
    return datasource.getPopular(page: page);
  }
}

// La función `getPopular` en esta clase es la implementación del contrato definido en `MoviesRepository`. Su única responsabilidad es llamar al método `getPopular` del `datasource` que se le inyectó y retornar el resultado. Esta separación permite cambiar la fuente de datos (por ejemplo, de TheMovieDB a otra API) sin tener que modificar la lógica de negocio que utiliza el repositorio.