import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: _ButtonsView(),//Paso 1
      floatingActionButton: FloatingActionButton(//Paso 3
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

//Paso 2
class _ButtonsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(//Paso 7
      width: double.infinity,//Paso 8
      child: Padding(//Paso 4
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,//Paso 6
          alignment: WrapAlignment.center,//Paso 9
          children: [
            ElevatedButton(//Paso 3
              onPressed: () {},child: const Text('Elevated'),
            ),

            ElevatedButton(//Paso 5
              onPressed: null,child: const Text('Elevated disabled'),
            ),

            ElevatedButton.icon(//Paso 6
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
        ),
      ),
    );
  }
}