//Paso 1: usar onTap para detectar taps en los items del BottomNavigationBar
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0, 
      //Paso 1.1: Agregamos el onTap para detectar taps en los items
      onTap(value){
        print('$value');
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio',
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorías', 
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        ),
      ],
    );
  }
}

//Paso 2: Creamos la función onItemTapped para manejar la navegación
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  //PAso 2.1: Crear una función para manejar los taps
  void onItemTapped(BuildContext context, int index) {
    //Paso 2.2: Usar un switch para manejar la navegación según el índice
    switch (index) {
      case 0: // 
        context.go('/'); //Después lo modificamos a la ruta correcta
      break;
      case 1:
        context.go('/'); //Después lo modificamos a la ruta correcta
      break;
      case 2:
        context.go('/favorites'); //Después lo modificamos a la ruta correcta
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0, 
      onTap(value){
        print('$value');
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio',
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorías', 
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        ),
      ],
    );
  }
}

//Paso 3: En onTap llamamos a la función onItemTapped
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0: 
        context.go('/');
      break;
      case 1:
        context.go('/');
      break;
      case 2:
        context.go('/favorites'); 
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0, 
      onTap:(value) => onItemTapped(context, value), //Paso 3.1: Llamar a la función onItemTapped
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio',
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorías', 
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        ),
      ],
    );
  }
}

//Paso 4: Creamos currentIndex para resaltar el item seleccionado(Código final)
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  //Paso 4.1: Crear una función para obtener el índice actual según la ruta
  int currentIndex(BuildContext context) {
    //Paso 4.2: Obtener la ubicación actual usando GoRouterState
    final String location = GoRouterState.of(context).matchedLocation;

  //Paso 4.3: Usar un switch para retornar el índice según la ruta
    switch (location) {
      case '/':
        return 0;
      case '/categories':
        return 1;
      case '/favorites':
        return 2;
      default:
        return 0;
    }
    
  }

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0: 
        context.go('/');
      break;
      case 1:
        context.go('/');
      break;
      case 2:
        context.go('/favorites'); 
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0, 
      currentIndex: currentIndex(context), //Paso 4.4: Asignar el índice actual al BottomNavigationBar   
      onTap:(value) => onItemTapped(context, value),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio',
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorías', 
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        ),
      ],
    );
  }
}