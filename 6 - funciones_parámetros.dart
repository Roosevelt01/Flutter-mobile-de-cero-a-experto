void main() {
  print(greetEveryone());
  
  print('Suma: ${addTwoNumbersOptional(10, 20)}'); // Suma 10 y 20
print('Suma: ${addTwoNumbersOptional(10)}'); // Suma 10 y 0 (por defecto)

}

addTwoNumbersOptional(int i, int j) {
  return a + b;
}

String greetEveryone() => 'Hello everyone!';

int addTwoNumbersOptional2(int a, [int b = 0]) {
  b ??= 0; // Asegura que b tenga un valor
  return a + b;
}

