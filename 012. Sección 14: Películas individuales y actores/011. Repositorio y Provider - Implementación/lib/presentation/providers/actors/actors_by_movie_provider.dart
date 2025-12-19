import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_resporitory_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

// 1. Definimos el Provider
final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref){
  
  // Obtenemos la referencia al repositorio
  final actorsRepository  = ref.watch( actorsRepositoryProvider );

  // Retornamos el Notifier inyectando la función del repositorio
  return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});

// 2. Definimos el Callback (Firma de la función)
typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

// 3. Definimos el Notifier (Clase que maneja el estado)
class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>>{
    final GetActorsCallback getActors;
    
    ActorsByMovieNotifier({
      required this.getActors,
    }): super({});// Estado inicial: Mapa vacío

    Future<void> loadActors(String movieId) async{
      // Verificación de caché: Si ya existen actores para esta película, no hacemos nada
      if(state[movieId] != null) return;
     
      // Petición de datos
      final List<Actor> actors= await getActors(movieId);

      // Actualización de estado (Crea un nuevo mapa con los datos anteriores + nuevos)
      state = { ...state, movieId: actors };
    }
}