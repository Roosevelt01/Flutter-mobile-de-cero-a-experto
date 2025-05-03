class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false, // Asegura que el provider se cree inmediatamente
          create: (_) => DiscoverProvider()..loadNextPage(), // Crea el provider y llama a loadNextPage
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


import 'package:flutter/material.dart';

void main() => runApp(const PageViewExampleApp());

class PageViewExampleApp extends StatelessWidget {
  const PageViewExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Ejemplo básico de PageView')),
        body: const PageView(
          children: <Widget>[
            Center(
              child: Text('Página 1', style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            Center(
              child: Text('Página 2', style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            Center(
              child: Text('Página 3', style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
          ],
          scrollDirection: Axis.horizontal, // Scroll horizontal por defecto
        ),
      ),
    );
  }
}
