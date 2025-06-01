import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),//AppBar
      //Paso 1: Se extrae el cuerpo a un nuevo widget _ButtonsView
      body: _ButtonsView(),
      // Paso 2: Se añade un FloatingActionButton
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),// FloatingActionButton
    ); //Scaffold
  }
}

// Paso 3: Definición del nuevo widget _ButtonsView
class _ButtonsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(// Paso 4: Se envuelve el contenido en un SizedBox
      //Paso 5: El SizedBox toma el ancho máximo disponible
      child: Padding(// Paso 6: Se añade un Padding alrededor del Wrap
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(// Contenedor que organiza los botones
          //Paso 7: Espaciado horizontal entre los elementos del Wrap
          spacing: 10,
          // <-- Paso 8: Alineación central de los elementos en el Wrap
          alignment: WrapAlignment.center,
          children: [

            //Paso 9: Primer botón de ejemplo
            ElevatedButton(
              onPressed: () {},// Callback vacío, el botón es funcional
              child: const Text('Elevated'),
            ),

            //Paso 10: Botón Elevado Deshabilitado
            ElevatedButton(
              onPressed: null, // Si onPressed es null, el botón se deshabilita
              child: const Text('Elevated disabled'),
            ),

            // Paso 11 (cont.): Constructor de botón con icono
            ElevatedButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated icon')
            ),

            //Paso 12: Botón Relleno Básico (FilledButton)
            FilledButton(onPressed: (){}, child: const Text('Filled')),

            //Paso 13: Botón Relleno con Icono
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Filled icon')
            ),

            // Paso 14: Botón Contorneado Básico (OutlinedButton)
            OutlinedButton(
              onPressed: () {}, child: const Text('Outlined'),
            ),

            //Paso 15: Botón Contorneado con Icono
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text('Outlined icon'),              
              icon: const Icon(Icons.terminal),
            ),

            //Paso 16: Botón de Texto Básico (TextButton)
            TextButton(
              onPressed: () {}, child: const Text('Text'),
            ),

            // Paso 17: Botón de Texto con Icono
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_box_outlined),
              label: const Text('Text icon'),
            ),

            // Paso 18: Botón de Icono Puro (IconButton)
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.app_registration_rounded)
            ),
            
            //Paso 19: Botón de Icono Personalizado con Estilo
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),

          ],
        ),
      ),
    );
  }
}



