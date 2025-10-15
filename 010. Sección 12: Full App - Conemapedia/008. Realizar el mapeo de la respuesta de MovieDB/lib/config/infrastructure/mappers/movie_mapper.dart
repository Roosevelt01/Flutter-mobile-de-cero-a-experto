
import 'package:cinemapedia/config/infrastructure/models/moviedb/movie_moviedb.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(

    adult: moviedb.adult,
    // Paso 4.1: Transforma el `backdropPath` para construir la URL completa. Si no hay imagen, usa una por defecto.
    backdropPath: (moviedb.backdropPath != '')
      ? 'https://image.tmdb.org/t/p/w500${ moviedb.backdropPath }'
      : 'https://cdn.displate.com/artwork/270x380/2023-02-03/6b806b90ed460362ce845aec44991468_ee90576e764e6e2dc6be65372d967710.jpg',
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    // Paso 4.2: Transforma el `posterPath` para construir la URL completa. Si no hay imagen, usa una por defecto.
    posterPath: (moviedb.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${ moviedb.posterPath }'
      : 'https://cdn.displate.com/artwork/270x380/2023-02-03/6b806b90ed460362ce845aec44991468_ee90576e764e6e2dc6be65372d967710.jpg',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
}