import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

//Paso 1: Se define la pantalla para el cambio de tema como un `ConsumerWidget` para poder interactuar con los providers de Riverpod.
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
    //Paso 1.1: Se observa el estado del `selectedColorProvider` para obtener el índice del 
    //color actualmente seleccionado.
    final int selectedColor = ref.watch( selectedColorProvider );
    
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
          final Color color = colors[index];
          
          return RadioListTile(
            title: Text("Este color", style: TextStyle(color: color)),
            subtitle: Text('${ color.value}'),
            activeColor: color,
            value: index, 
            //Paso 1.2: El `groupValue` se enlaza al `selectedColor` para que el 
            //`RadioListTile` correcto aparezca como seleccionado.
            groupValue: selectedColor, 
            onChanged: (value){
              //Paso 1.3: Al cambiar la selección, se actualiza el estado del `selectedColorProvider`
              //con el nuevo índice. Se usa `ref.read` porque solo queremos escribir el valor, no necesitamos 
              //escuchar los cambios en este punto.
               ref.read( selectedColorProvider.notifier ).state = value ?? 0;
            },        
          );
      },
    );
  }
}

//Paso 2: Se implementa la lógica para cambiar entre modo claro y oscuro.
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
            onPressed: () {
              //Paso 2.1: Al presionar el botón, se lee el notifier del `isDarkModeProvider` y se actualiza su
              //estado al valor opuesto (`true` a `false` y viceversa).
              ref.read( isDarkModeProvider.notifier ).state = !isDarkMode;
            }, 
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
    
    final int selectedColor = ref.watch( selectedColorProvider );
    
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
          final Color color = colors[index];
          
          return RadioListTile(
            title: Text("Este color", style: TextStyle(color: color)),
            subtitle: Text('${ color.value}'),
            activeColor: color,
            value: index, 
            groupValue: selectedColor, 
            onChanged: (value){
              ref.read( selectedColorProvider.notifier ).state = value ?? 0;
            },
        
          );
      },
    );
  }
}