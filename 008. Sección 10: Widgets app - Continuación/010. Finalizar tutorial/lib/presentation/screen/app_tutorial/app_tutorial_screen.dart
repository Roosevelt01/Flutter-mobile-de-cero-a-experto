import 'package:flutter/material.dart';

//Paso 1 Añadir la Imagen
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
      // Paso 1.1: Reemplaza el Placeholder en el widget _Slide con la estructura 
      //básica de la UI, comenzando con la imagen.
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
}

//Paso 2: Añadir Títulos y Espaciado
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
              //Paso 2.1: Añade los Text para el título y la descripción, 
              separados por SizedBox para crear espacio vertical.
              const SizedBox(height: 20),
              Text(title),
              const SizedBox(height: 10),
              Text(caption),
            ],
          ),
        ),
      );
  }
}

//Paso 3: Alinear el Contenido
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
          //Paso 3.1: Centra la columna verticalmente.
          mainAxisAlignment: MainAxisAlignment.center,
          //Paso 3.2: Se alinea el texto a la izquierda.
          crossAxisAlignment: CrossAxisAlignment.start,
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
}

// Paso 4: Aplicar Estilos del Tema
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
      //Paso 4.1: Obtén estilos de texto del tema global de la aplicación
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
              // Paso 4.2: Se aplica a los Text widgets para un diseño consistente.
              Text(title, style: titleStyle),
              const SizedBox(height: 10),
              // Paso 4.3: Se aplica a los Text widgets para un diseño consistente.
              Text(caption, style: captionStyle),
            ],
          ),
        ),
      );
  }
}

// Paso 5: Ajustar el Color de Fondo
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
      // Paso 5.1: Cambia el color de fondo del Scaffold a blanco para que 
      coincida con el fondo de las imágenes.
      backgroundColor: Colors.white,
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
}

// Paso 6: Superponer el Botón "Salir" con Stack(Código final)
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
      //paso 6.1: Envuelve el PageView en un Stack
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

          //Paso 6.2: Se añade un TextButton posicionado en la esquina superior derecha.
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