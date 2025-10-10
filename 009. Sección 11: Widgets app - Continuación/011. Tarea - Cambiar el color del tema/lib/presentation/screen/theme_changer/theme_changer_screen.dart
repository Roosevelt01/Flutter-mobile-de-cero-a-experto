import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    final isDarkMode = ref.watch( themeNotifiesProvider ).isDarkMode;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
                actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              ref.read( themeNotifiesProvider.notifier ).toggleDarkmode(); 
            }, 
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

//Paso 1: Este widget `_ThemeChangerView` es un `ConsumerWidget` que se encarga de construir la interfaz para cambiar el color del tema de la aplicación.
class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    
    final List<Color> colors = ref.watch( colorListProvider ); // Se obtiene la lista de colores disponibles para el tema desde `colorListProvider`.
    
    //Paso 1.1:
    final int selectedColor = ref.watch( themeNotifiesProvider ).selectedColor;
    
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
              //Paso 1.2: Al seleccionar un `RadioListTile`, se llama al método `changeColorIndex` del `ThemeNotifier` para actualizar el color del tema con el índice seleccionado.
              ref.read( themeNotifiesProvider.notifier ).changeColorIndex(value!);
            },
        
          );
      },
    );
  }
}