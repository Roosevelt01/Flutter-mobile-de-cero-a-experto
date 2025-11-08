import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

//Paso 1: Se convierte el widget de StatelessWidget a StatefulWidget para poder manejar estado, como el controlador de scroll.
/*class MovieHorizontalListview extends StatefulWidget {
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
  State<MovieHorizontalListview> createState() => _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,      
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(title: widget.title, subTitle: widget.subTitle),

          Expanded(
            child: ListView.builder(
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: widget.movies[index]);
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
                const SizedBox(width: 3),
                Text('${ movie.voteAverage }', style: textStyle.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
                const SizedBox(width: 10),
                Text(HumanFormarts.number( movie.popularity ), style: textStyle.bodySmall)
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
}*/

//Paso 2: Se introduce un ScrollController para detectar la posición del scroll y cargar más películas.
/*class MovieHorizontalListview extends StatefulWidget {
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
  State<MovieHorizontalListview> createState() => _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {
  final scrollController = ScrollController(); // Paso 2.1: Se crea un controlador para el scroll de la lista.
 
  // Paso 2.2: Se utiliza el ciclo de vida del widget para inicializar y destruir el listener del scroll.
  @override
  void initState() {
    super.initState(); // Se llama al initState del padre para asegurar la inicialización correcta del widget.

    scrollController.addListener(() { // Se añade un listener para reaccionar a los cambios en el scroll.

    });
  }

  @override
  void dispose() { // Paso 2.3: Se implementa el método dispose para limpiar los recursos del controlador.
    scrollController.dispose(); // Se libera la memoria del controlador cuando el widget se destruye para evitar fugas de memoria.
    super.dispose(); // Se llama al dispose del padre para limpiar otros recursos.
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,      
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(title: widget.title, subTitle: widget.subTitle),

          Expanded(
            child: ListView.builder(
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: widget.movies[index]);
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
                const SizedBox(width: 3),
                Text('${ movie.voteAverage }', style: textStyle.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
                const SizedBox(width: 10),
                Text(HumanFormarts.number( movie.popularity ), style: textStyle.bodySmall)
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
}*/

//Paso 3: Se implementa la lógica para el "infinite scroll" y se asocia el controlador al ListView.
class MovieHorizontalListview extends StatefulWidget {
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
  State<MovieHorizontalListview> createState() => _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {
  final scrollController = ScrollController();  
 
  @override
  void initState() {
    super.initState();

    scrollController.addListener(() { 
      if (widget.loadNextPage == null) return; // Paso 3.1: Si no se proporciona la función `loadNextPage`, no se hace nada.

      // Paso 3.2: Se comprueba si la posición actual del scroll está a 200 píxeles o menos del final.
      if((scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent){
        //print("Load next movies");

        widget.loadNextPage!(); // Se llama a la función para cargar la siguiente página de películas.
      }
    });
  }

  @override
  void dispose() { 
    scrollController.dispose(); 
    super.dispose(); 
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,      
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(title: widget.title, subTitle: widget.subTitle),

          Expanded(
            child: ListView.builder(
              controller: scrollController, //Paso 3.3: Se asigna el controlador de scroll al ListView para poder escuchar sus eventos.
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: widget.movies[index]);
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
                const SizedBox(width: 3),
                Text('${ movie.voteAverage }', style: textStyle.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
                const SizedBox(width: 10),
                Text(HumanFormarts.number( movie.popularity ), style: textStyle.bodySmall)
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