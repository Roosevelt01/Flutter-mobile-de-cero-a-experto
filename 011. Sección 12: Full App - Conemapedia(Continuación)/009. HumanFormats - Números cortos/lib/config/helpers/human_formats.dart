//Paso 1:
/*class HumanFormarts{
   //PAso 1.1:
  static String number( double number){
     return '';
  }
}*/

//Paso 2:

import 'package:intl/intl.dart'; // Paso 2.1;

class HumanFormarts{
  static String number( double number){
    //Paso 2.2:
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0, // Agregale comenatio
      symbol: '', // Agregale comentario
      locale: 'en'// Agregale comentario
    ).format(number);// Agregale comentario

     return formattedNumber;// Agregale comentario
  }

}
