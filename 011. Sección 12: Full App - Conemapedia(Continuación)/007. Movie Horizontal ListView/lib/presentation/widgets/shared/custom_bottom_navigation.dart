// Paso 1: Define la estructura inicial del widget de navegación.

/*import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {

  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}*/

// Paso 2: Implementa el widget `BottomNavigationBar`.(Código final)
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0, // Elimina la sombra para un diseño más limpio.
      items: const [
        // Paso 2.1: Define el primer elemento de la barra de navegación.
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio',
        ),
        
        // Paso 2.2: Define el segundo elemento para la sección de categorías o búsqueda.
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorías', 
        ),
        
        // Paso 2.3: Define el tercer elemento para la sección de favoritos.
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        ),
      ],
    );
  }
}