//Paso 1: Configuración inicial para integrar Riverpod en la aplicación.
import 'package:flutter_riverpod/legacy.dart'; 

// Paso 1.2: Creamos un "provider" de estado simple utilizando StateProvider.
// - `StateProvider` es ideal para manejar estados simples y mutables (como números, strings, booleanos, enums).
// - `<int>` especifica que el tipo de dato que este provider manejará es un entero.
// - `(ref) => 5` es la función que crea el estado inicial. En este caso, el contador comenzará con el valor 5.
final counterProvider = StateProvider<int>((ref) => 5);