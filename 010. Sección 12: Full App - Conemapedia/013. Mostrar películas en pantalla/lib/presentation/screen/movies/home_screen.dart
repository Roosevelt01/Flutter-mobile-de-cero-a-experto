//Paso 1:
/*import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  static const String name = 'home-screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeBiew(),//Paso 1.1:
    );
  }
}

//Paso 1.2:
class _HomeBiew extends StatelessWidget {
  const _HomeBiew();

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}*/

//Paso 2:
/*import 'package:flutter/material.dart';

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

//Paso 2.1: se cambiat staless por stateful
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
}*/

//Paso 3:
/*import 'package:flutter/material.dart';

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

class _HomeBiew extends StatefulWidget {
  const _HomeBiew();

  @override
  State<_HomeBiew> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeBiew> {

  //Paso 3.1: se agrega el metodo initState
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}*/

//Paso 4:
/*import 'package:flutter/material.dart';
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

//Paso 4.1: se cambia StatefulWidget por ConsumerStatefulWidget
class _HomeBiew extends ConsumerStatefulWidget {
  const _HomeBiew();

  
  @override
  _HomeViewState createState() => _HomeViewState(); // Paso 4.2: se colo _HomeViewState al principio
}

//Paso 4.3: se cambia State por ConsumerState
class _HomeViewState extends ConsumerState<_HomeBiew> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}*/

//Paso 5:
/*import 'package:cinemapedia/presentation/providers/providers.dart';
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

    //Paso 5.1: cargar los movies
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}*/

//Paso 6:
/*import 'package:cinemapedia/presentation/providers/providers.dart';
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

    //Paso 6.1: escuchar los movies
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    return Placeholder();
  }
}*/

//Paso 7:
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
    //Paso 7.1: mostrar los movies en una lista
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