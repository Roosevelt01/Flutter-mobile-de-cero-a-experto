
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
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }
  
  //Paso 1: Se implementa el método para obtener las películas mejor calificadas, cumpliendo con el contrato de MoviesRepository.
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    // Delega la llamada directamente al método correspondiente en el datasource.
    return datasource.getTopRated(page: page);
  }
  
  //Paso 2: Se implementa el método para obtener los próximos estrenos, cumpliendo con el contrato de MoviesRepository.
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    // Delega la llamada directamente al método correspondiente en el datasource.
    return datasource.getUpcoming(page: page);
  }
}

// Este archivo contiene la implementación concreta del `MoviesRepository`. La clase `MovieRepositoryImpl` actúa como un intermediario entre el dominio de la aplicación y la fuente de datos (`datasource`). Su responsabilidad es cumplir con el contrato definido por `MoviesRepository`, delegando las llamadas a los métodos correspondientes del `datasource` que se le inyecta. Esta separación permite cambiar la fuente de datos (por ejemplo, a una base de datos local) sin tener que modificar el código que consume el repositorio.
