import 'package:flutter/material.dart'; // Importa la librería principal de Flutter.
import 'package:provider/provider.dart'; // Importa el paquete provider para la gestión del estado.
import 'package:yes_no_app/domain/entities/message.dart'; // Importa la definición de la entidad Message.
import 'package:yes_no_app/presentation/providers/chat_provider.dart'; // Importa el provider para la lógica del chat.
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart'; // Importa el widget para los mensajes del usuario.
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart'; // Importa el widget para los mensajes recibidos.
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart'; // Importa el widget para la entrada de mensajes.

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key}); // Constructor del widget ChatScreen.

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Proporciona la estructura visual básica de la pantalla.
      appBar: AppBar( // Barra superior de la pantalla.
        leading: const Padding( // Añade un espacio alrededor del widget leading.
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar( // Muestra una imagen de perfil en forma de círculo.
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzyDzGUOkGUhw1tLvonMzkSk4XSa4f4aVtmEo6fyKOSoKE4jFiUH0V5MeY_B2RZRCMuPI&usqp=CAU'),
          ),
        ),
        title: const Text('Alejandro'), // Título de la barra de aplicación.
        centerTitle: false, // Alinea el título a la izquierda.
      ),
      body: _ChatView(), // Cuerpo principal de la pantalla, un widget privado.
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>(); // Escucha los cambios en el ChatProvider.
    return SafeArea( // Asegura que el contenido no se superponga con elementos del sistema.
      child: Padding( // Añade un espacio alrededor del contenido.
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column( // Organiza los widgets hijos verticalmente.
          children: [
            Expanded( // Expande el widget hijo para llenar el espacio disponible.
              child: ListView.builder( // Construye una lista de widgets bajo demanda.
                controller: chatProvider.chatScrollController, // Controla el desplazamiento de la lista.
                itemCount: chatProvider.messagesList.length, // Número de elementos en la lista.
                physics: const BouncingScrollPhysics(), // Añade un efecto de rebote al desplazarse.
                itemBuilder: (context, index) { // Función para construir cada elemento de la lista.
                  final message = chatProvider.messagesList[index]; // Obtiene el mensaje actual.
                  return (message.fromWho == FromWho.hers) // Comprueba quién envió el mensaje.
                      ? HerMessageBubble(message: message) // Muestra un mensaje recibido.
                      : MyMessageBubble(message: message); // Muestra un mensaje enviado por el usuario.
                },
              ),
            ),
            MessageFieldBox( // Widget para la entrada de nuevos mensajes.
              onValue: chatProvider.sendMessage, // Función a llamar al enviar un mensaje.
            ),
          ],
        ),
      ),
    );
  }
}