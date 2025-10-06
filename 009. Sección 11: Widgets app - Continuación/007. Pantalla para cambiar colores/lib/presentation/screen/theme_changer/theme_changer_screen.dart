import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

//Paso 1: Creación de la pantalla para cambiar el tema de la aplicación.
/*class ThemeChangerScreen extends StatelessWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [],
      ),
    );
  }
}*/

//Paso 2: Se convierte el widget a `ConsumerWidget` para poder interactuar con los providers de Riverpod.
/*class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    final isDarkMode = ref.watch( isDarkModeProvider );//Paso 2.1: Se utiliza `ref.watch` para estar pendiente de los cambios en el `isDarkModeProvider`.
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
                actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined), //Paso 2.2: El ícono cambia dependiendo del valor de `isDarkMode` para reflejar el tema actual (oscuro o claro).
            onPressed: () {}, 
          ),
        ],
      ),
    );
  }
}*/

//Paso 3: Se prepara la estructura para mostrar la lista de temas de colores.
/*class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    final isDarkMode = ref.watch( isDarkModeProvider );
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
                actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {}, 
          ),
        ],
      ),
      body: _ThemeChangerView(),//Paso 3.1: Se establece `_ThemeChangerView` como el cuerpo de la pantalla, donde se mostrarán las opciones de tema.
    );
  }
}

//Paso 3.2: Se crea un nuevo widget `_ThemeChangerView` para encapsular la lógica y la vista de la lista de temas.
class _ThemeChangerView extends StatelessWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/

//Paso 4: Se implementa la vista que mostrará la lista de temas.
/*class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    final isDarkMode = ref.watch( isDarkModeProvider );
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
                actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {}, 
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends StatelessWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context) {
    //Paso 4.1: Se utiliza un `ListView.builder` para construir la lista de colores de manera eficiente.
    return ListView.builder(
      itemBuilder: (context, index) {
          return Text("Color");
      },
    );
  }
}*/

//Paso 5: Se conecta la vista `_ThemeChangerView` con el provider que contiene la lista de colores.
/*class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    final isDarkMode = ref.watch( isDarkModeProvider );
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
                actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {}, 
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

//Paso 5.1: Se convierte `_ThemeChangerView` a `ConsumerWidget` para poder leer el estado de los providers.
class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  //Paso 5.2: El método `build` ahora recibe `ref` como segundo argumento, lo que permite interactuar con los providers.
  @override
  Widget build(BuildContext context, ref) {
    
    final List<Color> colors = ref.watch( colorListProvider );//Paso 5.3: Se utiliza `ref.watch` para obtener la lista de colores del `colorListProvider`.
    
    return ListView.builder(
      itemBuilder: (context, index) {
          return Text("Color");
      },
    );
  }
}*/

//Paso 6: Se construye la lista de `RadioListTile` para mostrar los temas de colores disponibles.
class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    final isDarkMode = ref.watch( isDarkModeProvider );
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
                actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {}, 
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    
    final List<Color> colors = ref.watch( colorListProvider );
    
    return ListView.builder(
      itemCount: colors.length, //Paso 6.1: Se establece la cantidad de elementos en la lista basándose en la longitud de la lista de colores.
      itemBuilder: (context, index) {
          final Color color = colors[index]; //Paso 6.2: Se obtiene el color correspondiente al índice actual de la lista.
          
          //Paso 6.3: Se crea un `RadioListTile` para cada color, permitiendo al usuario visualizar y seleccionar un tema.
          return RadioListTile(
            title: Text("Este color", style: TextStyle(color: color)),
            subtitle: Text('${ color.value}'),
            activeColor: color,
            value: index, 
            groupValue: 5, 
            onChanged: (value){},
        
          );
      },
    );
  }
}