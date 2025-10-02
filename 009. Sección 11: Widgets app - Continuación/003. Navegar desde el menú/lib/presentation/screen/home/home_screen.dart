import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

//Paso 1: Define la pantalla principal de la aplicación.
/*class HomeScreen extends StatelessWidget {
 static const String name = 'home_screen'; 
  
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>(); //Paso 1.1: Crea una GlobalKey para obtener una referencia única al estado del Scaffold.

    return Scaffold(
      key: scaffoldKey, //Paso 1.2: Asigna la GlobalKey al Scaffold. Esto permite controlar el Scaffold (ej. abrir el drawer) desde cualquier parte del widget.
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      ),
      body: const _HomeView(), 
      drawer: const SideMenu(), 
    );
  }
}

class _HomeView extends StatelessWidget {
 const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        
        return _CustomListTitle(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    return ListTile(
      leading: Icon(menuItem.icon,color:colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),

      onTap: () {
        context.push(menuItem.link);
      },

    );
  }
}*/

//Paso 2: Se pasa la `scaffoldKey` al `SideMenu` para permitirle cerrar el drawer.
class HomeScreen extends StatelessWidget {
 static const String name = 'home_screen'; 
  
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      ),
      body: const _HomeView(), 
      drawer: SideMenu(scaffoldKey: scaffoldKey), //Paso 2.1: Pasa la `scaffoldKey` al `SideMenu` para que este pueda cerrar el drawer.
    );
  }
}

class _HomeView extends StatelessWidget {
 const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        
        return _CustomListTitle(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    return ListTile(
      leading: Icon(menuItem.icon,color:colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),

      onTap: () {
        context.push(menuItem.link);
      },

    );
  }
}
