void main() {
  
  final pokemon = {
    'name':'Ditto',
    'hp':100,
    'IsAlive': true,
    'abilities': <String>['imposto'],
    'sprites':{
      1: 'ditto/front.png',
      2: 'ditto/back.png'
    }
  };
     
  print(pokemon);
  print('Name: ${pokemon['name']}');
  print('HP: ${pokemon['hp']}');
  print('Is Alive: ${pokemon['isAlive']}');
  print('Abilities: ${pokemon['abilities']}');
  print('Sprites: ${pokemon['sprites']}');
  
  print('Back: ${ pokemon['sprites'][2] }');
  print('Front: ${ pokemon['sprites'][1] }');
  
}
