import 'package:cinemapedia/infrastructure/datasources/actor_moviedeb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositores/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref){
  return ActorRepositoryImpl(ActorMovieDbDatasource() );

});