//Paso 1: Se crean los providers de Riverpod para gestionar el estado del tema.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false); 

final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0); 

//Paso 1: Se crea un objeto de tipo AppTheme que es controlado por un Notifier.
// Esto permite un manejo más centralizado y complejo del estado del tema.

//Paso 1.1: Se define un `StateNotifierProvider` que crea una instancia de `ThemeNotifier`.
// Este provider será el encargado de exponer el estado del tema (`AppTheme`) y permitir su modificación.
final themeNotifiesProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier());

//Paso 1.2: Se define la clase `ThemeNotifier` que extiende `StateNotifier<AppTheme>`.
// Esta clase contendrá la lógica para manejar y actualizar el estado del tema de la aplicación.
class ThemeNotifier extends StateNotifier<AppTheme> {
  // Se inicializa el estado con una instancia de `AppTheme()`, que contiene los valores por defecto.
  ThemeNotifier(): super(AppTheme());
}