import 'package:flutter/material.dart';

class PartenairesBloc with ChangeNotifier {
  int addPartenaire = 0;

  setAddPartenaire() {
    if (addPartenaire == 0) {
      addPartenaire = 1;
    } else {
      addPartenaire = 0;
    }
    notifyListeners();
  }
}
