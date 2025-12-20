import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_resporitory_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref){
  final actorsRepository  = ref.watch( actorsRepositoryProvider );

  return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>>{
    final GetActorsCallback getActors;
    
    ActorsByMovieNotifier({
      required this.getActors,
    }): super({});

    Future<void> loadActors(String movieId) async{
      if(state[movieId] != null) return;// Validación de Caché


      final List<Actor> actors= await getActors(movieId);// Petición HTTP

      // ---> BREAKPOINT AQUÍ <---
      state = { ...state, movieId: actors }; 
    }
}

//Redactame el paso a paso del breackpoint en state = { ...state, movieId: actors }; y para que sirve 