import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa el paquete provider
import 'package:tiktok/presentation/providers/discover_provider.dart'; // Importa DiscoverProvider
import 'package:tiktok/presentation/screens/discover/discover_screen.dart'; // Importa DiscoverScreen
import 'package:tiktok/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider( // Widget que permite proporcionar múltiples providers a sus hijos
      providers: [
        ChangeNotifierProvider(create: (_) => DiscoverProvider()), // Proporciona una instancia de DiscoverProvider
      ],
      child: MaterialApp(
        title: 'TikTok',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(), // Utiliza DiscoverScreen como la pantalla de inicio
      ),
    );
  }
}