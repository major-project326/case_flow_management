import 'package:intl/intl.dart';

class Utils {
  static List<String> generateMonthYearList() {
    List<String> monthYearList = [];
    DateTime now = DateTime.now();
    DateTime start = DateTime(now.year - 1, now.month);

    for (DateTime date = start;
        date.isBefore(now) || date.isAtSameMomentAs(now);
        date = DateTime(date.year, date.month + 1)) {
      monthYearList.add(DateFormat("MMMM yyyy").format(date));
    }

    return monthYearList;
  }
}
