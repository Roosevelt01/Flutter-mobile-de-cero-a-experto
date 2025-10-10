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

  void toggleDarkmode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  //Paso 1: Este método recibe un índice de color y actualiza el estado del tema con el nuevo color seleccionado, utilizando el método `copyWith` para mantener la inmutabilidad.
  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }

}