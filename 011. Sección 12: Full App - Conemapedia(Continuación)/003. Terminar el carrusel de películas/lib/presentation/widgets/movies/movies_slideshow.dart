import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

//Paso 1: Crear el widget MoviesSlideshow que recibe una lista de películas y las muestra en un Swiper.
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
        viewportFraction: 0.8, 
        scale: 0.9, 
        autoplay: true, 
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
    return Padding(// Se agrega un padding inferior para separar el slide del borde inferior
      padding: const EdgeInsets.only(bottom: 30), // Padding inferior de 30 píxeles
      child: Placeholder(),
    );
  }
}

//Paso 2: Agregar decoración a cada slide con bordes redondeados y sombra.
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
        viewportFraction: 0.8, 
        scale: 0.9, 
        autoplay: true, 
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

    //Paso 2.1: Definir la decoración con bordes redondeados y sombra
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 5,
          offset: Offset(0, 10),
        ),
      ],
    );

    return DecoratedBox( // Se utiliza DecoratedBox para aplicar la decoración
      decoration: decoration, // Aplicar la decoración al contenedor
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Placeholder(),
      ),
    );
  }
}

//Paso 3: Integrar la imagen de la película en cada slide.
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
        viewportFraction: 0.8, 
        scale: 0.9, 
        autoplay: true, 
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
          color: Colors.black45,
          blurRadius: 5,
          offset: Offset(0, 10),
        ),
      ],
    );

    return DecoratedBox( 
      decoration: decoration,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ClipRRect( // Envolvemos el Placeholder con ClipRRect para aplicar bordes redondeados a la imagen
          borderRadius: BorderRadius.circular(20), // Bordes redondeados para la imagen
          child: Placeholder()
        ),
      ),
    );
  }
}

//Paso 4: Mostrar la imagen de la película usando Image.network.
class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({
    super.key, 
    required this.movies 
  });

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8, 
        scale: 0.9, 
        autoplay: true, 
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
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, -7),
        ),
      ],
    );

    return DecoratedBox( 
      decoration: decoration,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ClipRRect( 
          borderRadius: BorderRadius.circular(20), 
          child: Image.network( // Paso 4.1: Mostrar la imagen de la película usando Image.network
            movie.backdropPath, // Usar la propiedad backdropPath de la película
            fit: BoxFit.cover, // Ajustar la imagen para cubrir todo el espacio disponible
          ),
        ),
      ),
    );
  }
}

//Paso 5: Agregar un indicador de carga mientras se carga la imagen
class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({
    super.key, 
    required this.movies 
  });

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8, 
        scale: 0.9, 
        autoplay: true, 
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
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, -7),
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
            //Paso 5.1: Agregar un loadingBuilder para mostrar un indicador de carga mientras se carga la imagen
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) { // La imagen se ha cargado completamente
                return const DecoratedBox( // Se devuelve el widget hijo sin modificaciones
                  decoration: BoxDecoration(color: Colors.black12), // Fondo gris claro mientras se carga la imagen
                );
              }
              return child; // La imagen se está cargando, se devuelve el widget hijo
            },
          ),
        ),
      ),
    );
  }
}

//Paso 6: Agregar una animación de desvanecimiento cuando la imagen se carga completamente.(Código final)
class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({
    super.key, 
    required this.movies 
  });

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8, 
        scale: 0.9, 
        autoplay: true, 
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
              return FadeIn (child: child ); // Paso 6.1: Usar FadeIn para animar la aparición de la imagen cargada
            },
          ),
        ),
      ),
    );
  }
}