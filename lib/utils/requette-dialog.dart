import 'package:flutter/material.dart';

Future<bool> dialogRequest(
    {required BuildContext context, required String title}) async {
  bool exitApp = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            content: Text(title),
            title: const Text('Swaped'),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('Non')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('Oui')),
            ],
          ));

  return exitApp;
}
