import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Definición del estilo del borde para el campo de texto.
    final outlineInputBorder = UnderlineInputBorder(
      // Establece el color del borde como transparente para que no se vea.
      borderSide: const BorderSide(color: Colors.transparent),
      // Redondea las esquinas del borde con un radio de 20 píxeles.
      borderRadius: BorderRadius.circular(20),
    );

    // Definición de la decoración del campo de texto.
    final inputDecoration = InputDecoration(
      // Aplica el estilo de borde definido en outlineInputBorder cuando el campo está habilitado.
      enabledBorder: outlineInputBorder,
      // Aplica el mismo estilo de borde cuando el campo tiene el foco.
      focusedBorder: outlineInputBorder,
      // Rellena el fondo del campo de texto con un color.
      filled: true,
      // Agrega un botón al final del campo de texto para enviar el mensaje.
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        // Función que se ejecuta al presionar el botón de envío.
        onPressed: () {
          // Imprime un mensaje en la consola para indicar que se presionó el botón.
          print('Valor de la caja de texto?');
        },
      ),
    );

    // Construcción del campo de texto.
    return TextFormField(
      // Aplica la decoración definida en inputDecoration al campo de texto.
      decoration: inputDecoration,
      // Función que se ejecuta cuando el usuario envía el formulario (presiona "Enter").
      onFieldSubmitted: (value) {
        // Imprime el valor del texto en la consola.
        print('changed: $value');
      },
      // Función que se ejecuta cada vez que el valor del texto cambia.
      onChanged: (value) {
        // Imprime el valor del texto en la consola.
        print('changed: $value');
      },
    );
  }
}