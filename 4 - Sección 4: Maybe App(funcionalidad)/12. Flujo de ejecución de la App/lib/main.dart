import 'package:flutter/material.dart'; // Importa la librería principal de Flutter para construir la UI.
import 'package:provider/provider.dart'; // Importa el paquete provider para la gestión del estado.
import 'package:yes_no_app/config/theme/app_theme.dart'; // Importa la definición del tema de la aplicación.
import 'package:yes_no_app/presentation/providers/chat_provider.dart'; // Importa el provider para la lógica del chat.
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart'; // Importa la pantalla principal del chat.

void main() => runApp(const MyApp()); // Función principal que inicia la aplicación.

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor del widget MyApp.

  @override
  Widget build(BuildContext context) {
    return MultiProvider( // Widget para proporcionar múltiples providers a sus hijos.
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()) // Proporciona una instancia de ChatProvider.
      ],
      child: MaterialApp( // Widget raíz de la aplicación que sigue las guías de Material Design.
        title: 'Yes No App', // Título de la aplicación.
        debugShowCheckedModeBanner: false, // Oculta la etiqueta de depuración.
        theme: AppTheme(selectedColor: 4).theme(), // Establece el tema visual de la aplicación.
        home: const ChatScreen(), // Define la pantalla de inicio de la aplicación.
      ),
    );
  }
}