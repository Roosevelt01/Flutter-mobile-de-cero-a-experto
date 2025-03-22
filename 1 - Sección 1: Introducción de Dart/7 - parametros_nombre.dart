//Ejemplo#1
void main() {
  
  print(greetPersona( name: 'Fernando', message: 'Hi, '));
 
}

String greetPersona({required String name, String message = 'Hola, '}){
  return '$message Fernando';
}

//Ejemplo #2
int sumar(int a, int b, int c) {
  return a + b + c;
}

void main() {
  print(sumar(1, 2, 3)); // Imprime 6
}

//Ejemplo #3
String crearTarjeta(
    {required String nombre, String? titulo, String? mensaje}) {
  String tarjeta = 'Nombre: $nombre';
  if (titulo != null) {
    tarjeta += ', Título: $titulo';
  }
  if (mensaje != null) {
    tarjeta += ', Mensaje: $mensaje';
  }
  return tarjeta;
}

void main() {
  print(crearTarjeta(nombre: 'Ana', mensaje: '¡Feliz cumpleaños!'));
  print(crearTarjeta(mensaje: 'Nos vemos pronto', nombre: 'Carlos'));
}
