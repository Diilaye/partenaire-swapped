import 'package:flutter/material.dart';

Future<DateTime?> showDateByDii(BuildContext context) async {
  return showDatePicker(
          locale: const Locale("fr", "FR"),
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2030))
      .then((value) => value);
}

Future<TimeOfDay?> showTimeByDii(BuildContext context) async {
  return showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  ).then((value) => value);
}
