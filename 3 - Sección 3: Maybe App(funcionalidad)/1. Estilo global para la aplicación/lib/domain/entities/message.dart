
// Definición de la enumeración 'FromWho' para identificar al remitente del mensaje.
enum FromWho {
  mine, // Indica que el mensaje fue enviado por el usuario actual.
  hers, // Indica que el mensaje fue enviado por otra persona.
}

// Definición de la clase 'Message', que representa una unidad de mensaje en la aplicación.
class Message {
  // Texto del mensaje, obligatorio.
  final String text;

  // URL opcional de una imagen asociada al mensaje (por ejemplo, un meme). Puede ser nulo.
  final String? imageUrl;

  // Identifica quién envió el mensaje, utilizando la enumeración 'FromWho'.
  final FromWho fromWho;

  // Constructor con nombre para la clase 'Message'.
  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
  });
}