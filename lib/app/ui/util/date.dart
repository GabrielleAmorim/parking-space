import 'package:intl/intl.dart';

class Date {
  static String formatDate(DateTime date) {
    if (date != null) {
      final f = DateFormat('dd/MM/yyyy HH:mm');
      return f.format(date);
    } else {
      return "";
    }
  }
}
