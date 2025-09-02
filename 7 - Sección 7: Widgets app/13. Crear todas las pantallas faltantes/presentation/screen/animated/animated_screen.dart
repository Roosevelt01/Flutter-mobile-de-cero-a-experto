import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

lib/
│   main.dart
│
├───config
│   ├───menu
│   │       menu_item.dart
│   │
│   ├───router
│   │       app_router.dart
│   │
│   └───theme
│           app_theme.dart
│
└───presentation
    └───screen
        │   screens.dart
        │
        ├───animated
        │       animated_screen.dart
        │
        ├───app_tutorial
        │       app_tutorial_screen.dart
        │
        ├───buttons
        │       buttons_screen.dart
        │
        ├───cards
        │       card_screen.dart
        │
        ├───home
        │       home_screen.dart
        │
        ├───infinite_scroll
        │       infinite_scroll_screen.dart
        │
        ├───progress
        │       progress_screen.dart
        │
        ├───snackbar
        │       snackbar_screen.dart
        │
        └───ui_controls
                ui_controls_screen.dart
