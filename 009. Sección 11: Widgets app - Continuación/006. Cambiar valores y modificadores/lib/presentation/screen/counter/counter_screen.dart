import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

//Paso 1: Para poder interactuar con los providers de Riverpod,
//el widget debe heredar de `ConsumerWidget` en lugar de `StatelessWidget`.
/*class CounterScreen extends ConsumerWidget { 
  
  static const name = 'counter_screen';
  
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
      final int clickCounter = ref.watch(counterProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child:
         Text(
          "Valor: $clickCounter", 
          style: Theme.of(context).textTheme.titleLarge,
          ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          //Paso 1.1: Para modificar el estado de un provider, usamos `ref.read`.
          // `.notifier` nos da acceso al controlador del estado, y con `.state++`
          // incrementamos su valor. Esto notifica a todos los widgets que estén
          // observando (con `ref.watch`) para que se actualicen.
          ref.read( counterProvider.notifier ).state++; 
          //ref.read( counterProvider.notifier ).update( (state) => state++); Alternativa
        }
      ),
    );
  }
}*/

//Paso 2: Se integra la funcionalidad para cambiar el tema de la aplicación.
class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    //Paso 2.1: Observamos el estado del `isDarkModeProvider`.
    // El widget se reconstruirá si el valor de `isDarkMode` cambia.
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            //Paso 2.2: El ícono cambia dinámicamente dependiendo del valor de `isDarkMode`.
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined, //Paso 2.2:
            ), 
            onPressed: () {
              //Paso 2.3: Usamos `ref.read` para leer el notifier del provider y cambiar su estado.
              // Aquí, se invierte el valor booleano actual para alternar entre modo claro y oscuro.
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Valor: $clickCounter",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
          //ref.read( counterProvider.notifier ).update( (state) => state++); Alternativa
        },
      ),
    );
  }
}
