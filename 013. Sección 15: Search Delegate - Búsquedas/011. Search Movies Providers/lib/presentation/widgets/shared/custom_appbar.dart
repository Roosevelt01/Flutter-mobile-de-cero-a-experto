//Paso 1: Modificamos el showSearch para que inicie con un valor de búsqueda
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_provide_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text(
                'Cinemapedia',
                style: titleStyle?.copyWith(color: colors.primary),
              ),

              const Spacer(),

              IconButton(
                onPressed: () async {
                  final movieRepository = ref.read(movieRepositoryProvider);

                  final movie = await showSearch<Movie?>(
                    query: 'antman' , // Pasoa 1.1: Valor de búsqueda inicial como prueba en la interfaz de búsqueda
                    context: context,
                    delegate: SearchMovieDelegate(
                      searchMovies: movieRepository.searchMovies,
                    ),
                  );

                  if (!context.mounted) return;

                  if (movie == null) return;

                  context.push('/movie/${movie.id}');
                },

                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Paso 2: Mpodificamos el showSearch para que inicie con un valor de búsqueda desde un provider
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_provide_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text(
                'Cinemapedia',
                style: titleStyle?.copyWith(color: colors.primary),
              ),

              const Spacer(),

              IconButton(
                onPressed: () async {
                  final movieRepository = ref.read(movieRepositoryProvider);
                  final searchQuery = ref.read(searchQueryProvider); //Paso 2.1: Leemos el valor inicial de búsqueda desde el provider

                  final movie = await showSearch<Movie?>(
                    query: searchQuery, // Paso 2.2: Usamos el valor leído como valor inicial de búsqueda
                    context: context,
                    delegate: SearchMovieDelegate(
                      searchMovies: movieRepository.searchMovies,
                    ),
                  );

                  if (!context.mounted) return;

                  if (movie == null) return;

                  context.push('/movie/${movie.id}');
                },

                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Paso 3: 
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_provide_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text(
                'Cinemapedia',
                style: titleStyle?.copyWith(color: colors.primary),
              ),

              const Spacer(),

              IconButton(
                onPressed: () async {
                  final movieRepository = ref.read(movieRepositoryProvider);
                  final searchQuery = ref.read(searchQueryProvider); 

                  final movie = await showSearch<Movie?>(
                    query: searchQuery, 
                    context: context,
                    delegate: SearchMovieDelegate(
                      //Paso 3.1: Actualizamos el valor del provider cuando se realiza una nueva búsqueda
                      searchMovies: (query){
                        //Paso 3.2: Agregamos la línea para actualizar el valor del provider
                        ref.read(searchQueryProvider.notifier).update((state) => query);
                        return movieRepository.searchMovies(searchQuery);
                      }
                    ),
                  );

                  if (!context.mounted) return;

                  if (movie == null) return;

                  context.push('/movie/${movie.id}');
                },

                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 