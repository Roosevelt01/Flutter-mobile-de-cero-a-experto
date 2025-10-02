import 'package:flutter/material.dart';

//Paso 1
/*class UiControlsScreen extends StatelessWidget {
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

          // Paso 1.1. (Gémini quiero que le agregues comentario a este widget)
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
}*/

//Paso 2
/*class UiControlsScreen extends StatelessWidget {
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
      // Paso 2.1. (Gémini quiero que le agregues comentario a este widget)
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
      ],
    );
  }
}*/

//Paso 3
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
  bool wantsBreakfast = false;// Paso 3.1(Gémini quiero que le agregues comentario a esta variable)
  bool wantsLunch = false;// Paso 3.2(Gémini quiero que le agregues comentario a esta variable)
  bool wantsDinner = false;// Paso 3.3(Gémini quiero que le agregues

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
      
        // Paso 3.4(Gémini quiero que le agregues comentario a este widget)
        CheckboxListTile(
          subtitle: const Text('¿Quieres desayunar?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        
        // Paso 3.5(Gémini quiero que le agregues comentario a este widget)
        CheckboxListTile(
          subtitle: const Text('¿Quieres desayunar?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),

        // Paso 3.6(Gémini quiero que le agregues comentario a este widget)
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

