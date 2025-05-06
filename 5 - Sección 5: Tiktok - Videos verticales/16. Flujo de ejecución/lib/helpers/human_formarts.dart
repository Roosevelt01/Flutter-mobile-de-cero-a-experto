// orden 1

// Quiero una breve explicación de cada línea de código y el flujo de ejecución de HumanFormart(Clase Números humanamente legibles)
//Agregale pequeños comentatios

import 'package:intl/intl.dart';

class HumanFormats{

  static String humanreadbleNumber(double number){
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);

    return formatterNumber;
  }
}