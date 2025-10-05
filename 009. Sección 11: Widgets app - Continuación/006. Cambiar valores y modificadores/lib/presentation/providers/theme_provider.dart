import 'package:flutter_riverpod/legacy.dart';

// StateProvider para gestionar el estado del modo oscuro (activado/desactivado).
// Su estado es un booleano: `true` para modo oscuro, `false` para modo claro.
final isDarkModeProvider = StateProvider<bool>((ref) => false); 