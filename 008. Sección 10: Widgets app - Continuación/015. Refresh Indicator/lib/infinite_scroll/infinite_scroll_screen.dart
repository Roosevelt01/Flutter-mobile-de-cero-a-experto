import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//Paso 1: Agregar el widget RefreshIndicator
/*class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true; 

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
    isMounted = false; 
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return; 
    isLoading = true; 
    setState(() {});

    await Future.delayed(const Duration(seconds: 2)); 
    
    addFiveImages(); 
    isLoading = false; 

    if (!isMounted) return; 
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
        child: RefreshIndicator(// Paso 1.1: Agregar el widget RefreshIndicator
          onRefresh: () {  }, // Paso 1.2: Agregar el callback onRefresh
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
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading? SpinPerfect(
          infinite: true, 
          child: Icon(Icons.refresh_outlined),
        ): 
        FadeIn(child: Icon(Icons.arrow_back_ios_new_outlined)), 
      )
    );
  }
}*/

//Paso 2: Implementar el método onRefresh
/*class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true; 

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
    isMounted = false; 
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return; 
    isLoading = true; 
    setState(() {});

    await Future.delayed(const Duration(seconds: 2)); 
    
    addFiveImages(); 
    isLoading = false; 

    if (!isMounted) return; 
      setState(() {});     

  }

  List<int> imagesIds = [1,2,3,4,5];

  // Paso 2.1: Implementar el método onRefresh
  Future<void> onRefresh() async {
    isLoading = true; // Indicar que se está cargando
    setState(() {}); // Actualizar la UI para mostrar el spinner

    await Future.delayed(const Duration(seconds: 2)); // Simular una espera de 2 segundos
    if (!isMounted) return; // Verificar si el widget sigue montado


     isLoading = false; // Asegurarse de que isLoading esté en false para que el botón no muestre el spinner
     final lastId = imagesIds.last; // Obtener el último ID de la lista actual
     imagesIds.clear(); // Limpiar la lista actual
     imagesIds.add(lastId + 1); // Agregar un nuevo ID a la lista
     addFiveImages(); // Agregar cinco imágenes más
     
     setState(() {}); // Actualizar la UI para reflejar los cambios
  }

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
        child: RefreshIndicator(
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
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading? SpinPerfect(
          infinite: true, 
          child: Icon(Icons.refresh_outlined),
        ): 
        FadeIn(child: Icon(Icons.arrow_back_ios_new_outlined)), 
      )
    );
  }
}*/

// Paso 3: Asignar el método onRefresh al callback
class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true; 

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
    isMounted = false; 
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return; 
    isLoading = true; 
    setState(() {});

    await Future.delayed(const Duration(seconds: 2)); 
    
    addFiveImages(); 
    isLoading = false; 

    if (!isMounted) return; 
      setState(() {});     

  }

  List<int> imagesIds = [1,2,3,4,5];

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {}); 

    await Future.delayed(const Duration(seconds: 2)); 
    if (!isMounted) return; 


     isLoading = false;
     final lastId = imagesIds.last; 
     imagesIds.clear(); 
     imagesIds.add(lastId + 1); 
     addFiveImages(); 
     
     setState(() {}); 
  }

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
        child: RefreshIndicator(
          onRefresh: onRefresh,// Paso 3.2: Asignar el método onRefresh al callback
          edgeOffset: 30, // Mueve el indicador justo debajo de la barra de estado
          strokeWidth: 2, // Ancho de la línea del indicador
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
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading? SpinPerfect(
          infinite: true, 
          child: Icon(Icons.refresh_outlined),
        ): 
        FadeIn(child: Icon(Icons.arrow_back_ios_new_outlined)), 
      )
    );
  }
}