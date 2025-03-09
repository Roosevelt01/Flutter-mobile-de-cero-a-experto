//Ejemplo #1

void main(){
  emitNumbers().listen((value){
    print('Stream value: $value');
  });
}

Stream<int> emitNumbers(){
  return Stream.periodic(const Duration(seconds: 1), (value){
    return value;
  }).take(5);
}

//Ejemplo #2



Future<int> sumarStream(Stream<int> stream) async {
  var suma = 0;
  await for (final valor in stream) {
    suma += valor;
  }
  return suma;
}

Stream<int> generarNumeros() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(milliseconds: 500)); // Simula un retraso
    yield i; // Envía el número al Stream
  }
}

void main() async {
  final miStream = generarNumeros();
  final resultado = await sumarStream(miStream);
  print('La suma es: $resultado'); // Salida: La suma es: 15
}

//Ejemplo #3
Stream<int> numeros = Stream.fromIterable([1, 2, 3, 4, 5]);

void main() async {
  numeros
      .where((numero) => numero % 2 == 0) // Filtra números pares
      .map((numero) => numero * 2) // Multiplica por 2
      .listen((numero) {
    print(numero); // Imprime: 4, 8, 10
  });
}


