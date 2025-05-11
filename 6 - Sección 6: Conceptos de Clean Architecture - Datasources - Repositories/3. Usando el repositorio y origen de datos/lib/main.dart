import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/domain/repositories/video_pots_repository.dart';
import 'package:tiktok/insfrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tiktok/insfrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tiktok/presentation/providers/discover_provider.dart';
import 'package:tiktok/presentation/screen/discover/discover_screen.dart';
import 'package:tiktok/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Paso 4: Crear la instancia del repositorio con la implementación local del datasource
    final videoPostReposity = VideoPostsRepository(
      videoPostsDatasource: LocalVideoDatasourceImpl(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          // Paso 5: Proveer el DiscoverProvider con el repositorio inyectado y cargar la primera página
          create: (_) => DiscoverProvider(videosRepository: videoPostReposity)..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        title: 'TikTok',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
