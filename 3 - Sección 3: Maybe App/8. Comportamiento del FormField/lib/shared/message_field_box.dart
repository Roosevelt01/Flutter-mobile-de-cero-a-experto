import 'dart:math';
import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Controlador para manejar el texto ingresado
    final textController = TextEditingController();//Paso 2
    // Nodo de enfoque para gestionar el teclado
    final focusNode = FocusNode();//Paso 10

    // Configuración del borde con esquinas redondeadas
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
    );

    // Decoración personalizada del campo de texto
    final inputDecoration = InputDecoration(
        hintText: 'End your message with a ??',//Paso 1: Texto guía
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,        
        filled: true,
        suffixIcon: IconButton(// Botón de enviar
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;//Paso 7: Obtiene el texto
            print('button: $textValue');//Paso 8: Imprime el texto
            textController.clear();//Paso 9: Limpia el campo
          },
        ),
      );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();//Paso 13: Quita el foco al tocar fuera
      },
      focusNode: focusNode,//Paso 11: Asigna el nodo de enfoque
      controller: textController,//Paso 3: Asigna el controlador
      decoration: inputDecoration,
      onFieldSubmitted: (value) {// Al enviar con Enter/Submit
        print('changed: $value');// Imprime el valor
        textController.clear();//Paso 5: Limpia el campo
        focusNode.requestFocus();//Paso 12: Mantiene el foco
      },
      //Paso 6: onChanged fue eliminado
    );
  }
}