void main() {
    
  final String pokemon = 'Ditto';
  final int hp = 100;
  final bool isAlive = true;
  final List<String>abilities = ['impostor'];
  final sprite = <String>['ditto/front.png','ditto/back.png'];
  
  print("""
    $pokemon  
    $hp
    $isAlive
    $abilities
    $sprite
  """);
}
