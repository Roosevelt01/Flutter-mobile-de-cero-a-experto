import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//Paso 1: Crear la pantalla
class InfiniteScrollScreen extends StatelessWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InfiniteScroll'),
      ),
    );
  }
}

//Paso 2: Añadir el ListView.builder
class InfiniteScrollScreen extends StatelessWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Paso 2.1: Se añade el ListView.builder
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text('Hola');
        },
      ),
    );
  }
}

//Paso 3: añadir imágenes
/*class InfiniteScrollScreen extends StatelessWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          //Paso 3.1: Devolver una imagen 
          return FadeInImage(
            width: double.infinity,
            height: 300,
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/id/237/500/300'),
          );
        },
      ),
    );
  }
}*/

//Paso 4: Ajustar la imagen
/*class InfiniteScrollScreen extends StatelessWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return FadeInImage(
            fit: BoxFit.cover, //Paso 4.1: Ajustar la imagen
            width: double.infinity,
            height: 300,
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/id/237/500/300'),
          );
        },
      ),
    );
  }
}*/

//Paso 5: Se convierte en StatefulWidget
/*class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return FadeInImage(
            fit: BoxFit.cover, 
            width: double.infinity,
            height: 300,
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/id/237/500/300'),
          );
        },
      ),
    );
  }
}*/

//Paso 6: Añadir una lista de imágenes
/*class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  
  List<int> imagesIds = [1,2,3,4,5];//Paso 6.1: Lista de imágenes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: imagesIds.length,//Paso 6.2: Definir el itemCount
        itemBuilder: (context, index) {
          return FadeInImage(
            fit: BoxFit.cover, 
            width: double.infinity,
            height: 300,
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'), //Paso 6.3: Cambiar la URL de la imagen
          );
        },
      ),
    );
  }
}*/

//Paso 7: Añadir un botón flotante
/*class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  
  List<int> imagesIds = [1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: imagesIds.length,
        itemBuilder: (context, index) {
          return FadeInImage(
            fit: BoxFit.cover, 
            width: double.infinity,
            height: 300,
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
          );
        },
      ),

      //Paso 7.1: Añadir un botón flotante
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      )
    );
  }
}*/

//Paso 8: Eliminar el padding superior del ListView
/*class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  
  List<int> imagesIds = [1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Paso 8.1: Eliminar el padding superior del ListView
      body: MediaQuery.removePadding(
        context: context,//Paso 8.2: Contexto
        removeTop: true,//Paso 8.3: Eliminar el padding superior
        removeBottom: true,//Paso 8.4: No eliminar el padding inferior
        child: ListView.builder(
          itemCount: imagesIds.length,
          itemBuilder: (context, index) {
            return FadeInImage(
              fit: BoxFit.cover, 
              width: double.infinity,
              height: 300,
              placeholder: const AssetImage('assets/images/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      )
    );
  }
}*/

//Paso 9: Cambiar el color de fondo(Código final)
class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  
  List<int> imagesIds = [1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, //Paso 9.1: Cambiar el color de fondo
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          itemCount: imagesIds.length,
          itemBuilder: (context, index) {
            return FadeInImage(
              fit: BoxFit.cover, 
              width: double.infinity,
              height: 300,
              placeholder: const AssetImage('assets/images/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      )
    );
  }
}