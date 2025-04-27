// Paso 5
class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  // Paso 6: Factory constructor para crear una instancia de YesNoModel desde un Map
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json['answer'],
        forced: json['forced'],
        image: json['image'],
      );

  // Paso 9: Método para convertir el YesNoModel a la entidad Message
  Message toMessageEntity() => Message(
        text: this.answer == 'yes' ? 'Sí' : (this.answer == 'no' ? 'No' : 'Tal vez'),
        fromWho: FromWho.hers,
        imageUrl: this.image,
      );
}