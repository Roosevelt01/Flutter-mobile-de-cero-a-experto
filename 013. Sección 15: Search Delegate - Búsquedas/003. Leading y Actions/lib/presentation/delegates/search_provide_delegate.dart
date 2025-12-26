//Paso 1: Se agrega <Movie?> para indicar que el SearchDelegate puede devolver una Movie o null
import 'package:cinemapedia/domain/entities/movie.dart'; // Importar la entidad Movie
import 'package:flutter/material.dart'; 

class SearchMovieDelegate extends SearchDelegate<Movie?> {
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

//Paso 2: Modificamos el botón leading para cerrar el SearchDelegate
import 'package:cinemapedia/domain/entities/movie.dart'; // Importar la entidad Movie
import 'package:flutter/material.dart'; 

class SearchMovieDelegate extends SearchDelegate<Movie?> {
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
    //Paso 2.1: Modificar el botón leading para cerrar el SearchDelegate
    return IconButton(
      onPressed: () => close(context, null), //Cerrar el SearchDelegate y devolver null
       icon: const Icon(Icons.arrow_back_ios_new_rounded) //Icono de flecha hacia atrás
    );
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

//Paso 3: Agregamos un botón para limpiar la búsqueda
import 'package:cinemapedia/domain/entities/movie.dart'; 
import 'package:flutter/material.dart'; 

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    //Paso 3.1: Agregar un botón para limpiar la búsqueda
    return [
      IconButton(
        onPressed: () => query = '', //Limpiar el texto de búsqueda
        icon: const Icon( Icons.clear) //Icono de limpiar
      ),
    ];
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), 
       icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    );
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

//Paso 4: Agregamos animaciones al botón de limpiar búsqueda
import 'package:animate_do/animate_do.dart'; //Paso 4.1: Importar animate_do para usar animaciones
import 'package:cinemapedia/domain/entities/movie.dart'; 
import 'package:flutter/material.dart'; 

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
           
    return [

        FadeIn( //Paso 4.2: Usar FadeIn para animar la aparición del botón
          animate: query.isNotEmpty, //Solo animar si el query no está vacío
          duration: const Duration(milliseconds: 200), //Duración de la animación
          child: IconButton(
            onPressed: () => query = '', 
            icon: const Icon( Icons.clear) 
          ),
        ),
      
    ];
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), 
       icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    );
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