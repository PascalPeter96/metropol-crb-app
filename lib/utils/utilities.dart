

import 'package:intl/intl.dart';

class Utilities {

  static String formatToUS(DateTime date) {
    return DateFormat('MM/dd/yyyy').format(date);
  }

}