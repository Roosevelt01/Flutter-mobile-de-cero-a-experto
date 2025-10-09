import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';
void main() { 
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
} 

//Paso 1: 
class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Se comentan las líneas anteriores que leían providers individuales.
    // final isDarkMode = ref.watch( isDarkModeProvider );
    // final selectedColor = ref.watch( selectedColorProvider );
        
    //Paso 1.1: Se utiliza `ref.watch` para observar el estado del `themeNotifiesProvider`.
    // Cada vez que el estado de `ThemeNotifier` cambie, el widget `MainApp` se reconstruirá.
    final AppTheme appTheme = ref.watch( themeNotifiesProvider );

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      //Paso 1.2: Se aplica el tema obtenido del `appTheme` al `MaterialApp`.
      theme: appTheme.getTheme(),
    );
  }
}
