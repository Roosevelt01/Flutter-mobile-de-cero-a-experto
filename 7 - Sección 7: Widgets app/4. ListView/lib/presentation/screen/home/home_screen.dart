import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      ),
      body: const _HomeView(),  // Paso 1: El cuerpo del Scaffold ahora es _HomeView
    );
  }
}

// Paso 2: Definición de la clase _HomeView
class _HomeView extends StatelessWidget {
 const _HomeView();// Constructor constante para _HomeView

  @override
  Widget build(BuildContext context) {
    return ListView.builder( // Widget para construir listas de forma eficiente
      itemCount: appMenuItems.length, // Número total de elementos en la lista
      itemBuilder: (context, index) { // Función constructora para cada elemento de la lista
        // Obtiene el MenuItem correspondiente al índice actual
        final menuItem = appMenuItems[index];
        
        // Usa el widget CustomListTitle para cada elemento
        return _CustomListTitle(menuItem: menuItem);
      },
    ); //ListView.builder
  }
}

// Paso 3: Definición de la clase _CustomListTitle
class _CustomListTitle extends StatelessWidget {
  // Propiedad para recibir el MenuItem
  final MenuItem menuItem;

  // Constructor constante que requiere el MenuItem
  const _CustomListTitle({
    required this.menuItem,
  });
    
  @override
  Widget build(BuildContext context) {
    // Accede a la paleta de colores del tema
    final colors = Theme.of(context).colorScheme;
    
    return ListTile(// Widget especializado para elementos de lista
      leading: Icon(menuItem.icon,color:colors.primary), // Icono a la izquierda
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary), // Icono a la derecha
      title: Text(menuItem.title), // Título principal del elemento
      subtitle: Text(menuItem.subTitle), // Subtítulo o descripción
      onTap: () {
        // TODO: Navegar a otra pantalla
        // Este es un marcador de posición para futuras implementaciones de navegación.
      },
    );
  }
}



