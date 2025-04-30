
class YesNoModel {
  // Campos que coinciden con las claves del JSON de la API
  final String answer;
  final bool forced;
  final String image;

  // Constructor generativo que requiere todos los campos
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  // ... (Aquí añadiremos el factory constructor) ...
}