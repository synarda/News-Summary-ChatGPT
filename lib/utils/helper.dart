import 'package:intl/intl.dart';

//With the Intl package, I aimed to write timelines more accurately.
class Parsers {
  static String dateTo(DateTime? date) {
    final formatter = DateFormat("dd-MM-yyyy");
    return formatter.format(date ?? DateTime.now());
  }
}
