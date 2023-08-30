import 'package:flutter/material.dart';

class AdminBloc with ChangeNotifier {
  int menu = 0;

  setMenu(int _menu) {
    menu = _menu;
    notifyListeners();
  }
}
