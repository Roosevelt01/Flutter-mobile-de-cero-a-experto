import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

//Paso 1: Crear el widget MoviesSlideshow que recibe una lista de películas
class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({
    super.key, 
    required this.movies 
  });

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;// Obtener los colores del tema actual
  
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8, 
        scale: 0.9, 
        autoplay: true, 
        // Añadir la sección de paginación
        pagination: SwiperPagination( // Indicadores de paginación
          builder: DotSwiperPaginationBuilder( // Puntos indicadores
            activeColor: colors.primary, // Color del punto activo
            color: colors.secondary // Color de los puntos inactivos
          )
        ),
        itemCount: movies.length, 
        itemBuilder: (context, index) =>  _Slide(movie: movies[index]),
      )
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(115, 196, 191, 191),
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    );

    return DecoratedBox( 
      decoration: decoration,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ClipRRect( 
          borderRadius: BorderRadius.circular(20), 
          child: Image.network( 
            movie.backdropPath, 
            fit: BoxFit.cover, 
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) { 
                return const DecoratedBox( 
                  decoration: BoxDecoration(color: Colors.black12),
                );
              }
              return FadeIn (child: child ); 
            },
          ),
        ),
      ),
    );
  }
}

//Paso 2: Ajustar la Posición de la Paginación.
class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({
    super.key, 
    required this.movies 
  });

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;
  
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8, 
        scale: 0.9, 
        autoplay: true, 
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0), // Ajustar el margen superior 
          builder: DotSwiperPaginationBuilder( 
            activeColor: colors.primary, 
            color: colors.secondary 
          )
        ),
        itemCount: movies.length, 
        itemBuilder: (context, index) =>  _Slide(movie: movies[index]),
      )
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(115, 196, 191, 191),
          blurRadius: 10,
          offset: Offset(0, -7),
        ),
      ],
    );

    return DecoratedBox( 
      decoration: decoration,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: ClipRRect( 
          borderRadius: BorderRadius.circular(20), 
          child: Image.network( 
            movie.backdropPath, 
            fit: BoxFit.cover, 
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) { 
                return const DecoratedBox( 
                  decoration: BoxDecoration(color: Colors.black12),
                );
              }
              return FadeIn (child: child ); 
            },
          ),
        ),
      ),
    );
  }
}