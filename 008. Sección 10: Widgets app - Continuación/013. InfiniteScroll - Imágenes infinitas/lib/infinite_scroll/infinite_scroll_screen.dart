import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//Paso 1: Crear un listado de imágenes que se vayan agregando conforme el usuario
class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  
  List<int> imagesIds = [1,2,3,4,5];

  //Paso 1.1: Crear el método para agregar imágenes
  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1,2,3,4,5].map((e) => lastId + e));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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

//Paso 2: Agregar el ScrollController para detectar cuando el usuario está cerca del final del scroll
class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollController = ScrollController(); // Paso 2.1: Crear el ScrollController

  //Paso 2.2: Inicializar el ScrollController y agregar el listener
  @override
  void initState() {
    super.initState();

    //Listener que se ejecuta cuando el usuario hace scroll
    scrollController.addListener(() {
      // Comprueba si el usuario está cerca del final del scroll
      if ( (scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent ) {
        // Si está cerca del final, agrega más imágenes
        addFiveImages();
      }
    });
  }

  //Paso 2.3: Liberar el ScrollController
  @override
  void dispose() {
    // Liberar el controlador cuando el widget se elimine del árbol de widgets
    scrollController.dispose();
    super.dispose();
  }


  List<int> imagesIds = [1,2,3,4,5];

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1,2,3,4,5].map((e) => lastId + e));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          controller: scrollController, //Paso 2.5: Asignar el ScrollController al ListView 
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

//Paso 3: _InfiniteScrollScreenState - Hacer la carga de imágenes asíncrona
class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollController = ScrollController();
  bool isLoading = false; // Paso 3.1: Variable para controlar si se está cargando

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ( (scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent ) {
        loadNextPage(); // Paso 3.2: Llamar a la función para cargar la siguiente página
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // Paso 3.3: Función para cargar la siguiente página
  Future loadNextPage() async {
    if (isLoading) return; // Si ya se está cargando, no hacer nada
    isLoading = true; // Indicar que se está cargando
    setState(() {});// Actualizar la UI para reflejar el estado de carga

    await Future.delayed(const Duration(seconds: 2)); // Simular un retraso de 2 segundos
    
    addFiveImages(); // Agregar más imágenes
    isLoading = false; // Indicar que ya no se está cargando
   
    setState(() {}); // Llama a setState UNA SOLA VEZ para actualizar la UI

  }

  List<int> imagesIds = [1,2,3,4,5];

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1,2,3,4,5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          controller: scrollController,
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

//Paso 4: _Mounting - Evitar setState si el widget ya no está montado(Código final)
class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true; // Paso 4.1: Variable para controlar si el widget está montado

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ( (scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent ) {
        loadNextPage(); 
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false; // Paso 4.2: Indicar que el widget ya no está montado
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return; 
    isLoading = true; 
    setState(() {});

    await Future.delayed(const Duration(seconds: 2)); 
    
    addFiveImages(); 
    isLoading = false; 

    if (!isMounted) return; // Paso 4.3: Si el widget está montado, salir de la función
      setState(() {});     

  }

  List<int> imagesIds = [1,2,3,4,5];

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1,2,3,4,5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          controller: scrollController,
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

[Pantalla Carga] -> initState() -> [Listener en espera]
       |
[Usuario hace scroll] 📜
       |
[Listener se ejecuta repetidamente] -> ¿Cerca del final? -> [NO]
       |
[Usuario se acerca al final]
       |
[Listener se ejecuta] -> ¿Cerca del final? -> [SÍ] ✅
       |
[Llama a loadNextPage()]
       |
1. isLoading = true, setState()
2. await Future.delayed(2s)  <-- Pausa Asíncrona ⏸️
3. addFiveImages()
4. isLoading = false, setState()
       |
[build() se ejecuta de nuevo] -> ListView.builder renderiza 5 nuevas imágenes ✨
