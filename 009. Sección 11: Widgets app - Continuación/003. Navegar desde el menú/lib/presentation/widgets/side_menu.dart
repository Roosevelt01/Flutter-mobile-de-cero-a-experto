import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

//Paso 1: Se implementa la lógica de navegación al seleccionar una opción del menú.
class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });        

        //Paso 1.1: Obtiene el `MenuItem` correspondiente al índice seleccionado.
        final menuItem = appMenuItems[value];

        //Paso 1.2: Utiliza `go_router` para navegar a la ruta especificada en el `link` del `MenuItem`.
        context.push(menuItem.link); 
      },

      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: Text("Main"),
        ),
        
        ...appMenuItems
          .sublist(0,3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title), 
          ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Text("More options"),
        ),

        ...appMenuItems
          .sublist(3) 
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title), 
          ),
        ),      
      ],
    );
  }
}

//Paso 2: Se pasa la `scaffoldKey` para poder controlar el `Scaffold` desde este widget(Código final)
class SideMenu extends StatefulWidget {
  //Paso 2.1: Declara una propiedad para recibir la GlobalKey del Scaffold.
  final GlobalKey<ScaffoldState> scaffoldKey; 
  
  const SideMenu({
    super.key,
    required this.scaffoldKey, //Paso 2.2: Hace que la `scaffoldKey` sea un parámetro requerido en el constructor.
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });        

        final menuItem = appMenuItems[value];
        context.push(menuItem.link); 
        //Paso 2.3: Usa la `scaffoldKey` para acceder al estado del Scaffold y cerrar el drawer.
        widget.scaffoldKey.currentState?.closeDrawer(); 

      },

      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: Text("Main"),
        ),
        
        ...appMenuItems
          .sublist(0,3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title), 
          ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Text("More options"),
        ),

        ...appMenuItems
          .sublist(3) 
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title), 
          ),
        ),      
      ],
    );
  }
}