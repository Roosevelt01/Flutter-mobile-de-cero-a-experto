import 'package:flutter/material.dart';

//Paso 1: Añadir el ExpansionTile
class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsViiew(),
    );
  }
}

class _UiControlsViiew extends StatefulWidget {
  const _UiControlsViiew();

  @override
  State<_UiControlsViiew> createState() => _UiControlsViiewState();
}

enum Transportation{car, plane, boat, submarine}

class _UiControlsViiewState extends State<_UiControlsViiew> {
  
  
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
          SwitchListTile(
            title: const Text('Developer Mode'), 
            subtitle: const Text('Controles adicionales'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
              isDeveloper = !isDeveloper;
            }),
          ),

          //  Introduce un ExpansionTile en el ListView para que actúe como contenedor de los RadioListTile.
          ExpansionTile(
            title: const Text('Vehículo de transporte'),
            subtitle: Text('$selectedTransportation'),
          ),

          RadioListTile(
            title: const Text('By Car'), 
            subtitle: const Text('Viajar por auto'),
            value: Transportation.car, 
            groupValue: selectedTransportation, 
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.car;
            }),
          ),

          RadioListTile(
            title: const Text('By boat'), 
            subtitle: const Text('Viajar por barco'),
            value: Transportation.boat, 
            groupValue: selectedTransportation, 
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.boat;
            }),
          ),
          
          RadioListTile(
            title: const Text('By plane'), 
            subtitle: const Text('Viajar por avión'),
            value: Transportation.plane, 
            groupValue: selectedTransportation, 
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.plane;
            }),
          ),

          RadioListTile(
            title: const Text('By submarine'), 
            subtitle: const Text('Viajar por submarino'),
            value: Transportation.submarine, 
            groupValue: selectedTransportation, 
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.submarine;
            }),
          ),

      ],
    );
  }
}

//Paso 2: Mover los RadioListTile Hijos
class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: const _UiControlsViiew(),
    );
  }
}

class _UiControlsViiew extends StatefulWidget {
  const _UiControlsViiew();

  @override
  State<_UiControlsViiew> createState() => _UiControlsViiewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViiewState extends State<_UiControlsViiew> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged:
              (value) => setState(() {
                isDeveloper = !isDeveloper;
              }),
        ),

        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            //Corta todos los RadioListTile y pégalos dentro de la propiedad children del ExpansionTile.
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por auto'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.car;
                  }),
            ),

            RadioListTile(
              title: const Text('By boat'),
              subtitle: const Text('Viajar por barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.boat;
                  }),
            ),

            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viajar por avión'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.plane;
                  }),
            ),

            RadioListTile(
              title: const Text('By submarine'),
              subtitle: const Text('Viajar por submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.submarine;
                  }),
            ),
          ],
        ),
      ],
    );
  }
}

//Paso 3: Definir el Estado y Añadir los Checkboxes(Código final)
class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: const _UiControlsViiew(),
    );
  }
}

class _UiControlsViiew extends StatefulWidget {
  const _UiControlsViiew();

  @override
  State<_UiControlsViiew> createState() => _UiControlsViiewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViiewState extends State<_UiControlsViiew> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  //Crea las variables de estado booleanas para las nuevas opciones
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged:
              (value) => setState(() {
                isDeveloper = !isDeveloper;
              }),
        ),

        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por auto'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.car;
                  }),
            ),

            RadioListTile(
              title: const Text('By boat'),
              subtitle: const Text('Viajar por barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.boat;
                  }),
            ),

            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viajar por avión'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.plane;
                  }),
            ),

            RadioListTile(
              title: const Text('By submarine'),
              subtitle: const Text('Viajar por submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.submarine;
                  }),
            ),
          ],
        ),
      
        // Se añade los CheckboxListTile correspondientes a la lista.
        CheckboxListTile(
          subtitle: const Text('¿Quieres desayunar?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        
        CheckboxListTile(
          subtitle: const Text('¿Quieres desayunar?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),

        CheckboxListTile(
          subtitle: const Text('¿Quieres cenar?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
                
      ],
    );
  }
}