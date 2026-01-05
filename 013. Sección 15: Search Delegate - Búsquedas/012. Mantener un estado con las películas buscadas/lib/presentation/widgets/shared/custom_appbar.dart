// Paso 1: último retoque mediante la modificación de searchMovie en el CustomAppBar
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
                  //final movieRepository = ref.read(movieRepositoryProvider);
                  final searchQuery = ref.read(searchQueryProvider); 

                  final movie = await showSearch<Movie?>(
                    query: searchQuery, 
                    context: context,
                    delegate: SearchMovieDelegate(
                      //Paso 1: Definimos la función para buscar películas mediante el StateNotifier
                      searchMovies: ref.read(searchedMoviesProvider.notifier).searchMoviesByQuery,
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