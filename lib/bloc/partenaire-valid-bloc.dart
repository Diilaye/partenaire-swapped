import 'package:flutter/material.dart';
import 'package:partenaire/services/partenaire-service.dart';

class PartenaireValidBloc with ChangeNotifier {
  TextEditingController identifiant = TextEditingController();

  PartenaireService partenaireService = PartenaireService();

  getIdentifiant(String id) async {
    identifiant.text = (await partenaireService.getIdentifiant(id))!;
    notifyListeners();
  }
}
