import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//Paso 1: Importar paquete animate_do 
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
        child: SpinPerfect( // Paso 1.1: Animacion al icono
          child: Icon(Icons.refresh_outlined), // Paso 1.2: Icono a animar
        ),
      )
    );
  }
}

//Paso 2. Hacer que la animacion sea infinita
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
        child: SpinPerfect(
          infinite: true, // Paso 2.1: Hacer que la animacion sea infinita
          child: Icon(Icons.refresh_outlined),
        ),
      )
    );
  }
}*/

//Paso 3: Animacion solo cuando isLoading es true 
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
        child: isLoading? SpinPerfect( // Paso 3.1: Animacion solo cuando isLoading es true
          infinite: true, 
          child: Icon(Icons.refresh_outlined),
        ): 
        FadeIn(child: Icon(Icons.arrow_back_ios_new_outlined)), // Paso 3.2: Animacion de entrada al icono (FadeIn)
      )
    );
  }
}*/

//Paso 4: Animacion de entrada al icono (FadeIn)
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
        child: isLoading? SpinPerfect(
          infinite: true, 
          child: Icon(Icons.refresh_outlined),
        ): 
        FadeIn(child: Icon(Icons.arrow_back_ios_new_outlined)), // Paso 4.1: Animacion de entrada al icono (FadeIn) 
      )
    );
  }
}*/

//Paso 5: Animacion de entrada al icono (FadeIn)
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
        child: isLoading? SpinPerfect(
          infinite: true, 
          child: Icon(Icons.refresh_outlined),
        ): 
        FadeIn(child: Icon(Icons.arrow_back_ios_new_outlined)), 
      )
    );
  }
}
