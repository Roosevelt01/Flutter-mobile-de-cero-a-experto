import 'dart:math';

import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();//Paso 2
    final focusNode = FocusNode();//Paso 10

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
    );

    final inputDecoration = InputDecoration(
        hintText: 'End your message with a ??',//Paso 1
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,        
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;//Paso 7
            print('button: $textValue');//Paso 8
            textController.clear();//Paso 9
          },
        ),
      );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();//Paso 13: Cuando toco fuera del TextFormField, se quita el foco
      },
      focusNode: focusNode,//Paso 11
      controller: textController,//Paso 3
      decoration:inputDecoration,
      onFieldSubmitted: (value) {
        print('changed: $value');
        textController.clear();//Paso 5
        focusNode.requestFocus();//Paso 12(Puedo seguir escribiendo porque el focus está mantiendo el elemento) 
      },
      //Paso 6: Borramos el onChanged
    );
  }
}
