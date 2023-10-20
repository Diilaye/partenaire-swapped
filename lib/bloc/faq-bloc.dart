import 'package:flutter/material.dart';

class FaqBloc with ChangeNotifier {
  int menuFaq = 0;

  setMenuFaq(int _select) {
    if (_select == menuFaq) {
      menuFaq = 0;
    } else {
      menuFaq = _select;
    }
    notifyListeners();
  }
}
