// Pantalla principal de chat que muestra la interfaz de usuario
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0), 
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzyDzGUOkGUhw1tLvonMzkSk4XSa4f4aVtmEo6fyKOSoKE4jFiUH0V5MeY_B2RZRCMuPI&usqp=CAU'),
          ),
        ),
        title: const Text('Alejandro'), 
        centerTitle: false, 
      ),
      // Cuerpo principal de la pantalla
      body: _ChatView(), // Widget privado que contiene la vista de chat
    );
  }
}

// Widget privado que implementa la vista de chat
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Asegura que el contenido no se solape con áreas del sistema
      child: Padding(
        // Padding horizontal para el contenido
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Lista de mensajes que ocupa todo el espacio disponible
            Expanded(
              child: ListView.builder(
                itemCount: 100, // Número total de elementos
                itemBuilder: (context, index) {
                  // Construye cada elemento de la lista
                  return Text("Índice: $index"); 
                },
              ),
            ),
            // Área inferior (futuro campo de entrada de mensajes)
            Text("Hola Mundo") // Placeholder temporal
          ],
        ),
      ),
    );
  }
}

