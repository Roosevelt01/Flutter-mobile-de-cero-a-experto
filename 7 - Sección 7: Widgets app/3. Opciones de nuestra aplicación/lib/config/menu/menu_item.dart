import 'package:flutter/material.dart';

// Paso 1: Definición de la clase MenuItem
class MenuItem{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

   // Constructor constante para crear instancias inmutables de MenuItem
  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

// Lista global de todos los elementos del menú de la aplicación
const appMenuItems = <MenuItem>[
  // Primer elemento del menú: Botones
  MenuItem(
    title: "Botones",
    subTitle: "Varios botones en Flutter",
    link: "/buttons",
    icon: Icons.smart_button_outlined,
  ),

  // Segundo elemento del menú: Botones
  MenuItem(
    title: "Tarjetas",
    subTitle: "Un contenedor estirilizado",
    link: "/card",
    icon: Icons.credit_card,
  ),
  
];