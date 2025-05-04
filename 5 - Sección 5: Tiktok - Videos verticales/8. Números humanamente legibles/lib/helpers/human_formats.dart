import 'package:intl/intl.dart'; // Importa el paquete intl para formateo de números.

class HumanFormats {
  // Define un método estático llamado humanReadableNumber que toma un número double como argumento.
  static String humanreadbleNumber(double number) {
    // Utiliza NumberFormat.compactCurrency para formatear el número de forma compacta.
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0, // Establece que no se muestren decimales.
      symbol: '', // Establece que no se muestre ningún símbolo de moneda.
    ).format(number); // Aplica el formato compacto al número proporcionado.

    // Retorna el número formateado como una cadena de texto.
    return formatterNumber;
  }
}