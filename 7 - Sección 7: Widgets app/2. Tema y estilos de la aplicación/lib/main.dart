import 'package:flutter/material.dart';
import 'package:widgets_app/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Aplicamos el tema utilizando nuestra clase AppTheme
      theme: AppTheme(selectedColor: 6).getTheme(),
      home: Scaffold(
        body: Center(
          // Ejemplo de un widget que adopta el tema
          child: FilledButton(child: Text("hola"), onPressed:(){},),
        ),
      ),
    );
  }
}
