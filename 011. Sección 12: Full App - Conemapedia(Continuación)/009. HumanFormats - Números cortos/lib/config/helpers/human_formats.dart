//Paso 1: Se define la clase `HumanFormats` para agrupar métodos de formato.
class HumanFormarts{
   //Paso 1.1: Se declara un método estático `number` para que pueda ser llamado sin instanciar la clase.
  static String number( double number){
     return '';
  }
}

//Paso 2: Se utiliza el paquete `intl` para formatear números de una manera más legible.
import 'package:intl/intl.dart'; // Paso 2.1: Se importa el paquete `intl` para acceder a sus funcionalidades de formato.

class HumanFormarts{
  static String number( double number){
    //Paso 2.2: Se utiliza `NumberFormat.compactCurrency` para crear un formato de número compacto.
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0, // No se mostrarán decimales.
      symbol: '', // No se mostrará ningún símbolo de moneda.
      locale: 'en'// Se usa la configuración regional 'en' (inglés) para el formato (ej. 1000 -> 1K).
    ).format(number);// Se aplica el formato al número recibido.

     return formattedNumber;// Se retorna el número formateado como un String.
  }

}