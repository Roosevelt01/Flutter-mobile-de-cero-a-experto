import 'package:flutter/material.dart';

//Paso 1: Definir el Modelo de Datos y la Lista de Slides
class SlideInfo{
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({required this.title, required this.caption,  required this.imageUrl, });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Busca la comida',
    caption: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
    imageUrl: 'assets/images/1.png'
  ),

  SlideInfo(
    title: 'Entrega rápida',
    caption: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.',
    imageUrl: 'assets/images/2.png'
  ),

  SlideInfo(
    title: 'Disfruta la comida',
    caption: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium.',
    imageUrl: 'assets/images/3.png'
  ),
];

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// Paso 2: Implementar el PageView Dinámico
class SlideInfo{
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Busca la comida',
    caption: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
    imageUrl: 'assets/images/1.png'
  ),

  SlideInfo(
    title: 'Entrega rápida',
    caption: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.',
    imageUrl: 'assets/images/2.png'
  ),

  SlideInfo(
    title: 'Disfruta la comida',
    caption: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium.',
    imageUrl: 'assets/images/3.png'
  ),

];

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //utilizamos PageView para generar sus hijos dinámicamente a partir de la lista slides
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: slides.map((slideData) => _Slide(
          title: slideData.title,
          caption: slideData.caption,
          imageUrl: slideData.imageUrl,
        )).toList(),
      ),
    );
  }
}

//2.1 Gemini agregale comentarios 
class _Slide extends StatelessWidget {
    final String title;
    final String caption;
    final String imageUrl;

    const _Slide({
      required this.title,
      required this.caption,
      required this.imageUrl,
    });

    @override
    Widget build(BuildContext context) {
      return const Placeholder();
  }
}