import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    //Paso 1: Se utiliza `ref.watch` para observar el estado del `themeNotifiesProvider` 
    //y obtener el valor actual de `isDarkMode`. El widget se reconstruirá si este valor cambia.
    final isDarkMode = ref.watch( themeNotifiesProvider ).isDarkMode;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
                actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              //Paso 1.1: Al presionar el botón, se utiliza `ref.read` para obtener 
              //el notificador y llamar al método `toggleDarkmode`, que cambia el estado del tema.
              ref.read( themeNotifiesProvider.notifier ).toggleDarkmode(); 
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