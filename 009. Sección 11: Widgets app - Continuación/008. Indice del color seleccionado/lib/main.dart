import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';
//Paso 1: Se envuelve la aplicación en un `ProviderScope` para que los providers de Riverpod estén disponibles en todo el árbol de widgets.
void main() { 
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
} 

//Paso 1.1: Se convierte `MainApp` en un `ConsumerWidget` para poder escuchar los cambios en los providers.
class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //Paso 1.2: Se observa el estado de `isDarkModeProvider` y `selectedColorProvider` para reconstruir el widget cuando cambien.
    final isDarkMode = ref.watch( isDarkModeProvider );
    final selectedColor = ref.watch( selectedColorProvider );

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      //Paso 1.3: Se crea una instancia de `AppTheme` con los valores actuales de color y modo oscuro, y se aplica el tema a la aplicación.
      theme: AppTheme(selectedColor: selectedColor, isDarkMode: isDarkMode).getTheme(),
    );
  }
}