import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map(
            (card) => _CardType1(
              elevation: card['elevation'],
              label: card['label'],
            ),
          ),

          ...cards.map(
            (card) => _CardType2(
              elevation: card['elevation'],
              label: card['label'],
            ),
          ),

          //Integrar _CardType3 en la Pantalla 
          ...cards.map(
            (card) => _CardType3(
              elevation: card['elevation'],
              label: card['label'],
            ),
          ),
          
          //Integrar _CardType4 en la Pantalla
          ...cards.map(
            (card) => _CardType4(
              elevation: card['elevation'],
              label: card['label'],
            ),
          ),
          
          // Añadir un espacio al final
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({ 
    required this.label,
    required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({ 
    required this.label,
    required this.elevation});

  @override
  Widget build(BuildContext context) {
    //Paso 3
    final colors = Theme.of(context).colorScheme;//Paso 3

    return Card(
      //Paso 4(shape)(En este paso recuerdarme plasmar el resultado)
      shape: RoundedRectangleBorder(
        borderRadius:  const BorderRadius.all(Radius.circular(12)), //Paso 5, recuerdarme plasmar el resyltado enla documnentation
        side: BorderSide(
          color: colors.outline
        ),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),//Paso 5
            ),
          ], 
        ),
      ),
    );
  }
}

//Creación de una Tarjeta con Relleno (Filled Card)
class _CardType3 extends StatelessWidget {
  
  final String label;
  final double elevation;

  const _CardType3({ 
    required this.label,
    required this.elevation});

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme; // Paso 1: Acceder a los Colores del Tema
    
    return Card(
      color: colors.surfaceContainerHigh, //Paso 2: Aplicar el Color de Fondo

      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("$label - filled"),
            ),
          ],
        ),
      ),
    );
  }
}

//Creación de una Tarjeta con Imagen de Fondo
class _CardType4 extends StatelessWidget {
  
  final String label;
  final double elevation;

  const _CardType4({
    required this.label,
    required this.elevation});

  @override
  Widget build(BuildContext context) {

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      // Paso 1: Se elimina el padding para que la imagen ocupe todo el espacio
      child: Stack(
        children: [
      
          //Paso 2: Añadir la Imagen de Fondo 
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/250',
            height: 350,
            fit: BoxFit.cover,
          ),
      
          Align(
            alignment: Alignment.topRight,
            child: Container( //Paso 3: Estilizar el Botón Superpuesto
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20)
                )
              ),
              child: IconButton(
                icon: Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
          ),
       ],
      ),
    );
  }
}