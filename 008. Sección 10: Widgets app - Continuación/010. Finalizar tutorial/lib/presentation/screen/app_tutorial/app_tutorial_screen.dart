import 'package:flutter/material.dart';

//Paso 1
/*class SlideInfo{
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
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            children: [
              Image(image: AssetImage(imageUrl)),
            ],
          ),
        ),
      );
  }
}*/

//Paso 2
/*class SlideInfo{
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
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            children: [
              Image(image: AssetImage(imageUrl)),
              //Paso 2.1
              const SizedBox(height: 20),
              Text(title),
              const SizedBox(height: 10),
              Text(caption),
            ],
          ),
        ),
      );
  }
}*/

//Paso 3
/*class SlideInfo{
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
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,//Paso 3.1
            crossAxisAlignment: CrossAxisAlignment.start,//Paso 3.2
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              Text(title),
              const SizedBox(height: 10),
              Text(caption),
            ],
          ),
        ),
      );
  }
}*/

// Paso 4
/*class SlideInfo{
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
      final titleStyle = Theme.of(context).textTheme.titleLarge;// Paso 4.1
      final captionStyle = Theme.of(context).textTheme.bodyMedium;// Paso 4.2

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              Text(title, style: titleStyle),// Paso 4.3
              const SizedBox(height: 10),
              Text(caption, style: captionStyle),// Paso 4.4
            ],
          ),
        ),
      );
  }
}*/

// Paso 5
/*class SlideInfo{
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
      backgroundColor: Colors.white,// Paso 5.1
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
}*/

// Paso 6
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
      backgroundColor: Colors.white,
      //paso 6.1: Envolemos el PageView con un Stack
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            children: slides.map((slideData) => _Slide(
              title: slideData.title,
              caption: slideData.caption,
              imageUrl: slideData.imageUrl,
            )).toList(),
          ),

          //Paso 6.2: Agregamos el botón
          Positioned(
            right: 30,
            top: 50,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Salir'),
            ),
          )
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