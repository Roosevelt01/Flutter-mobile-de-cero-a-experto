


void main() async{
  print('Inicio del programa');
  
  try{
    // Espera a que la petición HTTP se complete
    final value = await httpGet('htpps://fernando-herrera.com/cursos');  
    print('Éxito value $value');
  } on Exception catch(err){
    // Manejo de una excepción específica
    print('Tenemos una Exception: $err');
  }catch(err){
    // Manejo de cualquier otra excepción
    print('OOP!! algo terrible pasó: $err');
  }finally{
    // Código que se ejecuta siempre
    print('Fin del try y catch');
  }
      
  print('Fin del programa');
}

Future<String> httpGet(String url) async{
  // Simula una petición HTTP que tarda 1 segundo en completarse
  await Future.delayed( const Duration(seconds: 1), (){
    
    throw Exception('No hay parámetros en el URL');
    
    // Simulación de un error no controlado (comentado)
    //throw 'Error en la petición http';       
    
    // Simulación de una respuesta exitosa (comentada)
    //return 'Tenemos un valor de la petición http';    
  });
}
