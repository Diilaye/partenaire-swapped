import 'package:flutter/material.dart';
import 'package:partenaire/models/biens-model.dart';
import 'package:partenaire/services/bien-service.dart';

class AdminPartenaireBloc with ChangeNotifier {
  int menu = 0;

  setMenu(int _menu) {
    menu = _menu;
    notifyListeners();
  }

  BienService bienService = BienService();

  List<BiensModels> listeBien = [];

  getAllBien() async {
    listeBien = await bienService.all();
    notifyListeners();
  }

  AdminPartenaireBloc() {
    getAllBien();
  }
}
