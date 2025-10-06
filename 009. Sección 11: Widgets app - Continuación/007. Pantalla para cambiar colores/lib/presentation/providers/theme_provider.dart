//Paso 1: Se crean los providers de Riverpod para gestionar el estado del tema.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false); 

//Paso 1.1: Provider inmutable que expone la lista de colores (`colorList`) para ser utilizada en la UI.
final colorListProvider = Provider((ref) => colorList);