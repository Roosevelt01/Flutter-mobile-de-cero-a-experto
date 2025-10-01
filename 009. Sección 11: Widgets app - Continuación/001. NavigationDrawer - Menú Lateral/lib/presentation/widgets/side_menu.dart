import 'package:flutter/material.dart';

//Paso 1: creamos el stateful widget SideMenu
class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

//Paso 2: creamos el estado del widget
class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;// Paso 2.1: creamos una variable para controlar el index del menu lateral

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

//Paso 3: retornamos un NavigationDrawer
class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer( //Paso 3.1: retornamos un NavigationDrawer
      children:[] // Paso 3.2: dentro de children colocamos los elementos del menu
    );
  }
}

//Paso 4: Usamos NavigationDrawerDestination para colocar los elementos del menu
class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children:[
        // Paso 4.1: colocamos los elementos del menu
        NavigationDrawerDestination(
          icon: const Icon(Icons.add),
          label: const Text('Home Screen'),
        ),
        
        // Paso 4.2: colocamos mas elementos del menu
        NavigationDrawerDestination(
          icon: const Icon(Icons.add_shopping_cart),
          label: const Text('Otra pantalla'),
        )
      ]
    );
  }
}

//Paso 5: comprobamos el index seleccionado
/*class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 1; // lo cambiamos  a 1 para que inicie en la otra pantalla

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex, // Paso 5.1: indicamos el index seleccionado
      children:[
        NavigationDrawerDestination(
          icon: const Icon(Icons.add),
          label: const Text('Home Screen'),
        ),
        
        NavigationDrawerDestination(
          icon: const Icon(Icons.add_shopping_cart),
          label: const Text('Otra pantalla'),
        )
      ]
    );
  }
}*/

//Paso 6: OnDestinationSelected para controlar la seleccion del menu
class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 1; 

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) { // Paso 6.1: Con onDestinationSelected controlamos la seleccion del menu
        setState(() {});
          navDrawerIndex = value;// actualizamos el index seleccionado
      },
      children:[
        NavigationDrawerDestination(
          icon: const Icon(Icons.add),
          label: const Text('Home Screen'),
        ),
        
        NavigationDrawerDestination(
          icon: const Icon(Icons.add_shopping_cart),
          label: const Text('Otra pantalla'),
        )
      ]
    );
  }
}