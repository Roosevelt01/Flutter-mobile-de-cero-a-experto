

// Agregamos int decimals para definir el número de decimales a mostrar
import 'package:intl/intl.dart'; 

class HumanFormarts{
  static String number( double number, [int decimals = 0]){
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: decimals, // Usar el parámetro decimals para especificar el número de decimales
      symbol: '', 
      locale: 'en'
    ).format(number);

     return formattedNumber;
  }

}
