// Paso 1: Estructura inicial de la pantalla.
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  static const String name = 'home-screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(), // Se crea la vista principal.
    );
  }
}

// Widget para el cuerpo de la pantalla.
class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

// Paso 2: Convertir a StatefulWidget.
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  static const String name = 'home-screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
    );
  }
}

// Se convierte _HomeView de StatelessWidget a StatefulWidget.
class _HomeBiew extends StatefulWidget {
  const _HomeBiew();

  @override
  State<_HomeBiew> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeBiew> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

// Paso 3: Añadir ciclo de vida.
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  static const String name = 'home-screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeBiew(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {

  // Se añade el método initState para futuras inicializaciones.
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

// Paso 4: Integración con Riverpod.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  
  static const String name = 'home-screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
    );
  }
}

// Se convierte a ConsumerStatefulWidget para usar Riverpod.
class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  
  @override
  _HomeViewState createState() => _HomeViewState(); // Se ajusta el método createState.
}

// Se cambia State por ConsumerState para tener acceso a `ref`.
class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

// Paso 5: Cargar datos iniciales.
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  
  static const String name = 'home-screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeBiew();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    // Se cargan las películas al iniciar el widget.
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

// Paso 6: Escuchar el estado de las películas.
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  
  static const String name = 'home-screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    // Se escucha el provider para obtener la lista de películas.
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    return Placeholder();
  }
}

// Paso 7: Mostrar las películas en la UI.(Código final)
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  
  static const String name = 'home-screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeBiew(),
    );
  }
}

class _HomeBiew extends ConsumerStatefulWidget {
  const _HomeBiew();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeBiew> {

  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    // Se muestran las películas obtenidas en un ListView.
    return ListView.builder(
      itemCount: nowPlayingMovies.length,
      itemBuilder: (context, index) {
        final movie = nowPlayingMovies[index];
        return ListTile(
          title: Text( movie.title ),
        );
      },
    );
  }
}