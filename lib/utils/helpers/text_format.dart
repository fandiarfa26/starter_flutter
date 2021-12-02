import 'package:intl/intl.dart';

// ignore: avoid_types_as_parameter_names
String currencyFormat(num) {
  return NumberFormat.currency(
          locale: 'id', decimalDigits: 0, customPattern: '#,###.#')
      .format(num);
}
