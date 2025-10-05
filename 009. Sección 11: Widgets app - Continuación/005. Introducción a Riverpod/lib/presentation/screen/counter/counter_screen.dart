import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

//Paso 1: Convertir el widget para que pueda consumir datos de Riverpod.

//Paso 1.1: Se cambia `StatelessWidget` por `ConsumerWidget`. 
//Este es un widget especial de Riverpod que nos permite "escuchar" los cambios en los providers.
class CounterScreen extends ConsumerWidget { 
  
  static const name = 'counter_screen';
  
  const CounterScreen({super.key});

  //Paso 1.2: El método `build` en un `ConsumerWidget` recibe un segundo argumento, el `WidgetRef ref`.
  //`ref` es el objeto que nos permite interactuar con los providers (leer su estado, llamar métodos, etc.).
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child:
         Text(
          "Valor 10", 
          style: Theme.of(context).textTheme.titleLarge,
          ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){}
      ),
    );
  }
}

//Paso 2: Leer el Estado con ref.watch
class CounterScreen extends ConsumerWidget { 
  
  static const name = 'counter_screen';
  
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    // Paso 2.1: Usamos `ref.watch` para obtener el valor del `counterProvider`.
    // `watch` suscribe el widget a los cambios del provider. Cada vez que el valor
    // del contador cambie, este widget se reconstruirá para mostrar el nuevo valor.
    final int clickCounter = ref.watch(counterProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child:
         Text(
          "Valor: $clickCounter", // Paso 2.2: Mostramos el valor actual del provider en la UI.
          style: Theme.of(context).textTheme.titleLarge,
          ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){}
      ),
    );
  }
}