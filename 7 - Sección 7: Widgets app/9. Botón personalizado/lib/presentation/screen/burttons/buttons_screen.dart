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
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),// FloatingActionButton
    ); //Scaffold
  }
}

class _ButtonsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),

            ElevatedButton(
              onPressed: null, 
              child: const Text('Elevated disabled'),
            ),

            ElevatedButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated icon')
            ),

            FilledButton(onPressed: (){}, child: const Text('Filled')),

            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Filled icon')
            ),

            OutlinedButton(
              onPressed: () {}, child: const Text('Outlined'),
            ),

            OutlinedButton.icon(
              onPressed: () {},
              label: const Text('Outlined icon'),              
              icon: const Icon(Icons.terminal),
            ),

            TextButton(
              onPressed: () {}, child: const Text('Text'),
            ),

            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_box_outlined),
              label: const Text('Text icon'),
            ),

            CustomButton(),//Paso 1: Añadimos una instancia de CustomButton aquí

            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.app_registration_rounded)
            ),
            
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
          ],
        ),// Wrap
      ),// Padding
    );// SizeBox
  }
}

// Paso 2: Definición y estilización inicial del CustomButton
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(// Envuelve todo en ClipRRect para bordes redondeados
      borderRadius: BorderRadius.circular(20), //Define el radio de los bordes
      child: Material( // Envuelve el contenido en un widget Material
        color:colors.primary, // Aplica el color primario del tema como fondo
        child: InkWell( //Envuelve el Padding en un InkWell para efectos táctiles
          onTap: (){},
          child: const Padding(//Añade Padding alrededor del texto
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola Mundo', style: TextStyle( color: Colors.white)),
          ),// Padding
        )// InkWell
      ),// Material
    ); //ClipRRect
  }
}