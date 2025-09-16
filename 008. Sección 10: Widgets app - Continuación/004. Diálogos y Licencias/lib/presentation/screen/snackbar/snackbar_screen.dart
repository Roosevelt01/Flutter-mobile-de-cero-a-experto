import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//Paso 1
class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar y Diálogos')),

      //Paso 1: Construcción de la Interfaz de Usuario (UI)
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {},
              child: const Text('Licencias usadas'),
            ),

            FilledButton.tonal(
              onPressed: () {},
              child: const Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),

        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}

// Parte 2: Implementación del Diálogo de Licencias (showAboutDialog)
class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Diálogos'),
      ),

     body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              //Mostrar el Diálogo Básico
              showAboutDialog(context: context);
            },
            child: const Text('Licencias usadas'),
          ),
          
          FilledButton.tonal(
            onPressed: () {
            },
            child: const Text('Mostrar diálogo'),
          ),
        ],
      )
     ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        
        onPressed: () => showCustomSnackbar(context),
        
      ),
    );
  }
}

//Paso 3: Personalizar el Diálogo About
class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Diálogos'),
      ),

     body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Flutter Widgets',
                children: [
                  const Text('App de ejemplo para el curso de Flutter'),
                ]
              );
            },
            child: const Text('Licencias usadas'),
          ),
          
          FilledButton.tonal(
            onPressed: () {
            },
            child: const Text('Mostrar diálogo'),
          ),
        ],
      )
     ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        
        onPressed: () => showCustomSnackbar(context),
        
      ),
    );
  }
}

//Paso 4: Refactorizar la Lógica a un Método openDialog
class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //Implementación de un Diálogo Personalizado (AlertDialog)
  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Si aceptas, se eliminará el item'),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Diálogos'),
      ),

     body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(
                context: context,
                children: [
                  const Text('App de ejemplo para el curso de Flutter'),
                ]
              );
            },
            child: const Text('Licencias usadas'),
          ),
          
          FilledButton.tonal(
            // onPressed del segundo botón
            onPressed: () => openDialog(context),
            child: const Text('Mostrar diálogo'),
          ),
        ],
      )
     ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        
        onPressed: () => showCustomSnackbar(context),
        
      ),
    );
  }
}

//Paso 5: Añadir Botones de Acción
class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Si aceptas, se eliminará el item'),
        actions: [
          //Añade botones de "Cancelar"
          TextButton(
            onPressed: (){}, 
            child: const Text('Cancelar')
          ),
          //Añade botones de "Aceptar"
          FilledButton(
            onPressed: (){}, 
            child: const Text('Aceptar')
          ),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Diálogos'),
      ),

     body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(
                context: context,
                children: [
                  const Text('App de ejemplo para el curso de Flutter'),
                ]
              );
            },
            child: const Text('Licencias usadas'),
          ),
          
          FilledButton.tonal(
            onPressed: () => openDialog(context),
            child: const Text('Mostrar diálogo'),
          ),
        ],
      )
     ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        
        onPressed: () => showCustomSnackbar(context),
        
      ),
    );
  }
}

//Paso 6: Implementar el Cierre del Diálogo
class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Si aceptas, se eliminará el item'),
        actions: [
          TextButton(
            // Implementar el Cierre del Diálogo
            onPressed: () => context.pop(), 
            child: const Text('Cancelar')
          ),
          FilledButton(
            // Implementar el Cierre del Diálogo
            onPressed: () => context.pop(), 
            child: const Text('Aceptar')
          ),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Diálogos'),
      ),

     body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(
                context: context,
                children: [
                  const Text('App de ejemplo para el curso de Flutter'),
                ]
              );
            },
            child: const Text('Licencias usadas'),
          ),
          
          FilledButton.tonal(
            onPressed: () => openDialog(context),
            child: const Text('Mostrar diálogo'),
          ),
        ],
      )
     ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        
        onPressed: () => showCustomSnackbar(context),
        
      ),
    );
  }
}*/

//Paso 8
class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //Paso 8.1: (Gemini) Agregale comentarios a este codigo
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Si aceptas, se eliminará el item'),
        actions: [
          TextButton(
            onPressed: () => context.pop(), 
            child: const Text('Cancelar')
          ),
          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text('Aceptar')
          ),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Diálogos'),
      ),

     body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(
                context: context,
                children: [
                  const Text('App de ejemplo para el curso de Flutter'),
                ]
              );
            },
            child: const Text('Licencias usadas'),
          ),
          
          FilledButton.tonal(
            onPressed: () => openDialog(context),
            child: const Text('Mostrar diálogo'),
          ),
        ],
      )
     ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        
        onPressed: () => showCustomSnackbar(context),
        
      ),
    );
  }
}