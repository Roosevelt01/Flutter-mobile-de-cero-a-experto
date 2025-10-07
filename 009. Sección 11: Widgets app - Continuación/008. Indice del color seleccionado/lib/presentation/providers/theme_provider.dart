

//Paso 1: Se crean los providers de Riverpod para gestionar el estado del tema.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false); 

final colorListProvider = Provider((ref) => colorList);

//Paso 1: Provider para mantener el estado del color seleccionado (el índice en la lista de colores).
final selectedColorProvider = StateProvider((ref) => 0); 