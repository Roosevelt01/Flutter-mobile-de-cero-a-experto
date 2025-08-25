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
        title: const Text('Cards Screen'),//PAso 2
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
          // Paso 2: Añadir la nueva lista de tarjetas
          ...cards.map(
            (card) => _CardType2(
              elevation: card['elevation'],
              label: card['label'],
            ),
          ),
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

//Paso 1: Duplicar el widget _CardType1 y renombrarlo
class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({ 
    required this.label,
    required this.elevation});

  @override
  Widget build(BuildContext context) {
    // Paso 3: Obtener el esquema de colores del tema
    final colors = Theme.of(context).colorScheme;

    return Card(
      // Paso 4: Definir la forma y el borde de la tarjeta(En este paso recuerdarme plasmar el resultado)
      shape: RoundedRectangleBorder(
        borderRadius:  const BorderRadius.all(Radius.circular(12)), // Paso 5: Añadir radio a las esquinas 
        side: BorderSide(
          color: colors.outline// Usar el color del tema
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
              child: Text('$label - outline'),// Diferenciar el texto de la tarjeta
            ),
          ], 
        ),
      ),
    );
  }
}

