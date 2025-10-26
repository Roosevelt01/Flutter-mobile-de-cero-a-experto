import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

//Paso 1: Crear el widget MoviesSlideshow
class MoviesSlideshow extends StatelessWidget {

  const MoviesSlideshow({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

//Paso 2: Agregar la lista de películas como propiedad
class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies; //Paso 2.1: Agregar la propiedad movies

  const MoviesSlideshow({
    super.key, 
    required this.movies //Paso 2.2: Agregar el parámetro requerido movies
  });

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

//Paso 3: Configurar SizedBox y Swiper Básico
class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({
    super.key, 
    required this.movies 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        itemCount: movies.length, 
        itemBuilder: (context, index) {
          final movie = movies[index];
          return  _Slide(movie: movie); 
        }
      )
    );
  }
}

//Paso 3.2: Crear el widget _Slide
class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

//Paso 5: Código final completo
class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({
    super.key, 
    required this.movies 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        itemCount: movies.length, 
        itemBuilder: (context, index) =>  _Slide(movie: movies[index]), // Paso 4.1: Construir cada slide con el widget _Slide;
      )
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}