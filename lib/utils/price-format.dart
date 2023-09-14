import 'package:intl/intl.dart';

final oCcy = new NumberFormat("#,##0", "en_US");

String getFormatPrice(int value) {
  return oCcy.format(value);
}
