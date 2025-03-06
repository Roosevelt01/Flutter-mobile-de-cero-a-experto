void main() {
  print(greetEveryone());
  
  print('Suma: ${addtwoNumbersOptional(10,20)}');

}

String greetEveryone() => 'Hello everyone!';

int addtwoNumbersOptional(int a, [int b = 0]){
  b??=0;
  return a + b;
}

