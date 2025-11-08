//Paso 1: Se importan los paquetes necesarios para construir el widget.
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,      
      child: Column(
        children: [
          if (title != null || subTitle != null)
            _Title(title: title, subTitle: subTitle),

          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: movies[index]);
              } 
            )

          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: [
            SizedBox(
              width: 150,
              height: 160,
              child: ClipRRect( 
                borderRadius: BorderRadius.circular(20), 
                child: Image.network( 
                  movie.posterPath, 
                  fit: BoxFit.cover, 
                  width: 80,
                  loadingBuilder: (context, child, loadingProgress) {
                    if(loadingProgress != null){
                      return const Padding( 
                        padding: EdgeInsets.all(8.0), 
                        child: Center(child: CircularProgressIndicator(strokeWidth: 2),)
                      );
                    }

                    return FadeIn(child: child);
                  },
              ),
              ),
            ),
            
            SizedBox(
              width: 110,
              child: Text(
                movie.title,
                maxLines: 1,
                style: textStyle.titleSmall,
              ),
            ),

            
            Row(
              children: [
                Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                const SizedBox(width: 3), //Paso 1.1: Se añade un espacio de 3 píxeles entre el icono y el texto de la calificación.
                Text('${ movie.voteAverage }', style: textStyle.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
                const SizedBox(width: 10), //Paso 1.2: Se añade un espacio de 10 píxeles para separar la calificación de la popularidad.
                Text(HumanFormarts.number( movie.popularity ), style: textStyle.bodySmall)//Paso 1.3: Se muestra la popularidad de la película, formateando el número para que sea más legible (ej. 1000 -> 1K).
              ],
            ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),

          const Spacer(),

          if (subTitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subTitle!),
            ),
        ],
      ),
    );
  }
}