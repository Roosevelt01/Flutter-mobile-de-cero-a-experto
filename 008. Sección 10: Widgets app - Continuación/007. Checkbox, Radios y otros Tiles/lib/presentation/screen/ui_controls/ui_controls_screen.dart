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

class _UiControlsViiew extends StatelessWidget {
  const _UiControlsViiew();

  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}*/

//Paso 2
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
      body: const _UiControlsViiew(), //2.1 Agragale comentario 
    );
  }
}

class _UiControlsViiew extends StatelessWidget {
  const _UiControlsViiew();

  @override
  Widget build(BuildContext context) {
    return ListView(
    //2.2 Agragale comentario 
      physics: const ClampingScrollPhysics(),
      children: [
          SwitchListTile(
            value: true, 
            onChanged: (value){},
          ),
      ],
    );
  }
}*/

//Paso 3
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

class _UiControlsViiew extends StatelessWidget {
  const _UiControlsViiew();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
          SwitchListTile(
            title: const Text('Developer Mode'), //3.1 Agragale comentario
            subtitle: const Text('Controles adicionales'),//3.2 Agragale comentario
            value: true, 
            onChanged: (value){},
          ),
      ],
    );
  }
}*/

//Paso 4
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

//Paso 4.1 Se cambia stalessless a stateful
class _UiControlsViiew extends StatefulWidget {
  const _UiControlsViiew();

  @override
  State<_UiControlsViiew> createState() => _UiControlsViiewState();
}

class _UiControlsViiewState extends State<_UiControlsViiew> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
          SwitchListTile(
            title: const Text('Developer Mode'), 
            subtitle: const Text('Controles adicionales'),
            value: true, 
            onChanged: (value){},
          ),
      ],
    );
  }
}*/

//Paso 5
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

class _UiControlsViiewState extends State<_UiControlsViiew> {
  
  //Paso 5.1: Agragame comentario
  bool isDeveloper = true;
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
          SwitchListTile(
            title: const Text('Developer Mode'), 
            subtitle: const Text('Controles adicionales'),
            value: isDeveloper, //Paso 5.2: Agragame comentario
            //Paso 5.3: Agragame comentario
            onChanged: (value) => setState(() {
              isDeveloper = !isDeveloper;
            }),
          ),
      ],
    );
  }
}*/


//Paso 6
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

//Paso 6.1: Agregame comentario
enum Transportation{car, plane, boat, submarine}

class _UiControlsViiewState extends State<_UiControlsViiew> {
  
  
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car; //Paso 6.2: Agregame comentario
  
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

          //Paso 6.2: Agregame comentario
          RadioListTile(
            title: const Text('By Car'), 
            subtitle: const Text('Viajar por auto'),
            value: Transportation.car, 
            groupValue: selectedTransportation, 
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.car;
            }),
          ),

          //Paso 6.3: Agregame comentario
          RadioListTile(
            title: const Text('By boat'), 
            subtitle: const Text('Viajar por barco'),
            value: Transportation.boat, 
            groupValue: selectedTransportation, 
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.boat;
            }),
          ),
          
          //Paso 6.4: Agregame comentario
          RadioListTile(
            title: const Text('By plane'), 
            subtitle: const Text('Viajar por avión'),
            value: Transportation.plane, 
            groupValue: selectedTransportation, 
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.plane;
            }),
          ),

          //Paso 6.5: Agregame comentario
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



