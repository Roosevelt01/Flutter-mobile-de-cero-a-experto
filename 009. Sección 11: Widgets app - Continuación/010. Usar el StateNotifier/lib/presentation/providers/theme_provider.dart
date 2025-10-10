import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false); 

final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0); 

final themeNotifiesProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier(): super(AppTheme());

  //Paso 1: Este método invierte el estado actual de `isDarkMode` del tema y actualiza el estado del `ThemeNotifier` con la nueva configuración.
  void toggleDarkmode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

}