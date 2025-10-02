import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

//Paso 1: Versión inicial del menú lateral con opciones estáticas.
/*class SideMenu extends StatefulWidget {
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
      onDestinationSelected: (value) { 
        setState(() {});
          navDrawerIndex = value;
      },
      children:[

        // Título simple para la sección principal del menú.
        Text("Main"),

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

// Paso 2: Se añade lógica para ajustar el padding superior en dispositivos con 'notch'.
/*class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 1; 

  @override
  Widget build(BuildContext context) {
    // Paso 2.1: Determina si el dispositivo tiene un 'notch' o isla dinámica.
    // Se usa el padding superior de la vista; un valor mayor a 35 es un umbral
    // para considerar que existe un notch y se necesita un espaciado adicional.
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) { 
        setState(() {});
          navDrawerIndex = value;
      },
      children:[

        // Paso 2.1: Añade un padding superior condicional.
        // Si hay un notch, el padding es 0; de lo contrario, es 20 para evitar que el texto se pegue a la barra de estado.
        Padding( 
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: Text("Main")), 
        
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

// Paso 3: Se refactoriza el menú para generar las opciones dinámicamente a partir de una lista de `MenuItem`s.
/*class SideMenu extends StatefulWidget {
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
        setState(() {});
        navDrawerIndex = value;
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: Text("Main"),
        ),
        
        // Paso 3.1: Se itera sobre la lista `appMenuItems` y se usa el operador de propagación (...)
        // para añadir cada `NavigationDrawerDestination` como un hijo individual en la lista `children`.
        ...appMenuItems.map(
          (item) => NavigationDrawerDestination(
            icon: Icon(item.icon), // Paso 3.2: Asigna el ícono del `MenuItem`.
            label: Text(item.title), // Paso 3.3: Asigna el título del `MenuItem` como etiqueta.
          ),
        ),
      ],
    );
  }
}*/

//Paso 4: Se limita el número de opciones mostradas en el menú usando `sublist`.
/*class SideMenu extends StatefulWidget {
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
        setState(() {});
        navDrawerIndex = value;
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: Text("Main"),
        ),
        
        // Se utiliza sublist para tomar solo una porción de la lista de items.
        ...appMenuItems
          .sublist(0,3) //Paso 4.1: Crea una sub-lista con los primeros 3 elementos (índices 0, 1, 2).
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title), 
          ),
        ),
      ],
    );
  }
}*/

//Paso 5: Se añade un `Divider` para separar visualmente las secciones del menú.
/*class SideMenu extends StatefulWidget {
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
        setState(() {});
        navDrawerIndex = value;
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

        //Paso 5.1: Este `Padding` contiene un `Divider`, que es una línea horizontal utilizada para agrupar o separar contenido.
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Divider(),

        ),
        
      ],
    );
  }
}*/

//Paso 6: Se añade una segunda sección de opciones al menú, separada por un `Divider`.
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

        //Paso 6.1: Título para la segunda sección de opciones del menú.
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Text("More options"),
        ),

        //Paso 6.2: Genera el resto de las opciones del menú a partir del cuarto elemento.
        ...appMenuItems
          .sublist(3) // Crea una sub-lista desde el índice 3 hasta el final.
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title), 
          ),
        ),      
        
      ],
    );
  }
}