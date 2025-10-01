import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SlideInfo {
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
    caption:'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
    imageUrl: 'assets/images/1.png',
  ),

  SlideInfo(
    title: 'Entrega rápida',
    caption: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.',
    imageUrl: 'assets/images/2.png',
  ),

  SlideInfo(
    title: 'Disfruta la comida',
    caption:'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium.',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if(!endReached && page >= (slides.length - 1.5)){
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController, 
            physics: const BouncingScrollPhysics(),
            children: slides.map(
                      (slideData) => _Slide(
                        title: slideData.title,
                        caption: slideData.caption,
                        imageUrl: slideData.imageUrl,
                      ),
                    )
                    .toList(),
          ),

          Positioned(
            right: 30,
            top: 50,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Salir'),
            ),
          ),
          
          endReached ?
          Positioned(
            bottom: 30,
            right: 30, 
            child: FadeInRight(
              from: 15,
              duration: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Comenzar'),
              ),
            ),
          ): const SizedBox(),
        ],
      ),
    );
  }
}

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
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}

