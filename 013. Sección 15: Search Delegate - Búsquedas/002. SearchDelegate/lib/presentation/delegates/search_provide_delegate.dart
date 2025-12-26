//Paso 1: Crear el archivo search_provide_delegate.dart en la carpeta lib/presentation/delegates/
import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate{
  // Al extender de SearchDelegate, Flutter nos pedirá implementar 4 métodos obligatorios.
}

//Paso 2: Implementar los métodos 4 abstractos de SearchDelegate
import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate{
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  
  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }

 
}

//Paso 3: Implementar la lógica básica de cada método
import 'package:flutter/material.dart';

class searchMovieDelegate extends SearchDelegate{
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    // Paso 3.1: Retornar un botón de acción para limpiar la búsqueda
    return [
      const Text("buildActions"),
    ];
  }

  
  @override
  Widget? buildLeading(BuildContext context) {
    // Paso 3.2: Retornar un ícono de retroceso para cerrar la búsqueda
    return const Text("buildLeading");
  }

  
  @override
  Widget buildResults(BuildContext context) {
    // Paso 3.3: Retornar los resultados de la búsqueda
    return const Text("buildResults");
  }

  
  @override
  Widget buildSuggestions(BuildContext context) {
    // Paso 3.4: Retornar las sugerencias de búsqueda
    return const Text("buildSuggestions");
  }
}

//Paso 4: Personalizar el SearchDelegate
import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate{
  //Paso 4.1: Personalizar el texto del campo de búsqueda
  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      const Text("buildActions"),
    ];
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
    return const Text("buildLeading");
  }
  
  @override
  Widget buildResults(BuildContext context) {
    return const Text("buildResults");
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text("buildSuggestions");
  }
}