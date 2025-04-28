import 'package:yes_no_app/domain/entities/message.dart'; // Importa la clase Message, que representa un mensaje en el chat.

class YesNoModel { // Define la clase YesNoModel, que representa la estructura de la respuesta JSON de la API.
  final String answer; // Declara una propiedad final (inmutable) para almacenar la respuesta ("yes", "no", "maybe").
  final bool forced; // Declara una propiedad final para indicar si la respuesta fue forzada (booleano).
  final String image; // Declara una propiedad final para almacenar la URL de la imagen asociada a la respuesta.

  YesNoModel({ // Define el constructor principal de la clase YesNoModel.
    required this.answer, // Requiere que se proporcione un valor para la propiedad 'answer' al crear una instancia.
    required this.forced, // Requiere que se proporcione un valor para la propiedad 'forced'.
    required this.image, // Requiere que se proporcione un valor para la propiedad 'image'.
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel( // Define un factory constructor con nombre 'fromJsonMap'.
    answer: json["answer"], // Asigna el valor de la clave "answer" del mapa JSON a la propiedad 'answer' de la instancia.
    forced: json["forced"], // Asigna el valor de la clave "forced" del mapa JSON a la propiedad 'forced'.
    image: json["image"], // Asigna el valor de la clave "image" del mapa JSON a la propiedad 'image'.
  ); // Este constructor permite crear una instancia de YesNoModel a partir de un mapa JSON.

  Map<String, dynamic> toJson() => { // Define un método para convertir la instancia de YesNoModel a un mapa JSON.
    "answer": answer, // Asigna el valor de la propiedad 'answer' a la clave "answer" del mapa.
    "forced": forced, // Asigna el valor de la propiedad 'forced' a la clave "forced" del mapa.
    "image": image, // Asigna el valor de la propiedad 'image' a la clave "image" del mapa.
  }; // Este método permite serializar la instancia de YesNoModel a un formato JSON.

  Message toMessageEntity() => Message( // Define un método para convertir la instancia de YesNoModel a una entidad Message.
    text: answer, // Asigna el valor de la propiedad 'answer' del modelo al 'text' de la entidad Message.
    fromWho: FromWho.hers, // Establece el 'fromWho' de la entidad Message como 'FromWho.hers', indicando que el mensaje es de la otra persona.
    imageUrl: image, // Asigna el valor de la propiedad 'image' del modelo al 'imageUrl' de la entidad Message.
  ); // Este método actúa como un mapper desde el modelo YesNoModel a la entidad Message.
}