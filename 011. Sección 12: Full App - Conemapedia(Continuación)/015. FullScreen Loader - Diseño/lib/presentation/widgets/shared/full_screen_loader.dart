//Paso 1: Crear el widget FullScreenLoader
import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

//Paso 2: Reemplazar el Placeholder por un CircularProgressIndicator
import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(); // Indicador de carga circular
  }
}

//Paso 3: Mejorar el FullScreenLoader con un mensaje y estilo
import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    //Paso 3.2: Seleccionar un mensaje aleatorio
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Espere por favor"),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          
        ],
      ),
    ); 
  }
}

//Paso 4: Agregar mensajes dinámicos al FullScreenLoader
import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  //Paso 4.1: Método para obtener mensajes de forma periódica
  Stream<String> getLoadingMessages(){
    //Paso 4.2: Crear una lista de mensajes
    final messages = <String>[
      "Cargando contenido emocionante...",
      "Preparando la mejor experiencia para ti...",
      "Casi listo, gracias por tu paciencia...",
      "Buscando las mejores películas para ti...",
      "Cargando... ¡la diversión está en camino!",
    ];

    //Paso 4.3: Retornar un Stream que emite mensajes cada cierto tiempo
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step]; // Ciclar a través de los mensajes y el step indica el índice actual
    }).take(messages.length); // Limitar la cantidad de emisiones
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Espere por favor"),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          
          //Paso 4.4: Usar StreamBuilder para mostrar mensajes dinámicos
          StreamBuilder(
            stream: getLoadingMessages(), // Obtener el Stream de mensajes
            builder: (context, snapshot) {
              if(!snapshot.hasData) return const Text("Cargando..."); // Mensaje por defecto mientras no hay datos y el ! asegura que no es nulo
              
              return Text(snapshot.data!); // Mostrar el mensaje actual, el ! asegura que no es nulo
            },
          ),
        ],
      ),
    ); 
  }
}