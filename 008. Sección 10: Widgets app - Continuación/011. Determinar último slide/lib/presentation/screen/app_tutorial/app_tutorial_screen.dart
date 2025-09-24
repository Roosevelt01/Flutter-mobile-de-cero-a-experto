import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

//Paso 1: Convertir a StatefulWidget
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
    caption:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
    imageUrl: 'assets/images/1.png',
  ),

  SlideInfo(
    title: 'Entrega rápida',
    caption:
        'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.',
    imageUrl: 'assets/images/2.png',
  ),

  SlideInfo(
    title: 'Disfruta la comida',
    caption:
        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium.',
    imageUrl: 'assets/images/3.png',
  ),
];

//Paso 1.2: Convierte AppTutorialScreen de StatelessWidget a StatefulWidget.
class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
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

//Paso 2: Implementar el PageController 
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
  final PageController pageviewController = PageController();// Paso 2.1: Crear el PageController

  //Paso 2.2: Agregar el listener en el initState
  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      print('Página actual: ${pageviewController.page}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController, //Paso 2.3: Asignar el controller al PageView
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

//Paso 3: Añadir el Botón "Comenzar" Fijo
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

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      print('Página actual: ${pageviewController.page}');
    });
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
          
          //Paso 3.1: Agregar el botón "Comenzar"
          Positioned(
            bottom: 30,
            right: 30,
            child: FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Comenzar'),
            ),
          ),
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

//Paso 4: Renderizado Condicional del Botón
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
  bool endReached = false; //Paso 4.1: Nueva propiedad

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      print('Página actual: ${pageviewController.page}');
    });
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
          
          endReached ? //Paso 4.2: Mostrar el botón solo si endReached es true
          Positioned(
            bottom: 30,
            right: 30,
            child: FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Comenzar'),
            ),
          ): const SizedBox(), //Si no es true, mostramos un SizedBox vacío
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
}*/

//Paso 5: Actualizar endReached cuando se llegue al final
/*class SlideInfo {
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
      //Paso 5.1: Actualizar endReached cuando se llegue al final
      final page = pageviewController.page ?? 0;
      if(!endReached && page >= (slides.length - 1.5)){
        setState(() {
          endReached = true;
        });
      }
    });
  }

  //Paso 5.2: Liberar recursos
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
            child: FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Comenzar'),
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
}*/

//Paso 6: Agregar animación al botón
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
            child: FadeInRight( //Paso 6.1: Agregar la animación
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