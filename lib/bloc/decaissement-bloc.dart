import 'package:flutter/material.dart';
import 'package:partenaire/models/decaissement-model.dart';
import 'package:partenaire/services/decaissement-service.dart';

class DecaissementBloc with ChangeNotifier {
  DecaissementService decaissementService = DecaissementService();

  List<DecaissementModel>? decaissements = [];

  DecaissementModel? decaissement;
  getAllDecaissement() async {
    decaissements = await decaissementService.all();
    notifyListeners();
  }

  getOne(DecaissementModel? zon) {
    decaissement = zon;

    // titileT.value = TextEditingValue(text: decaissement!.decaissementitle!);
    minPriceT.value =
        TextEditingValue(text: decaissement!.minPrice!.toString());
    maxPriceT.value =
        TextEditingValue(text: decaissement!.maxPrice!.toString());
    notifyListeners();
  }

  DecaissementBloc() {
    getAllDecaissement();
  }

  String titre = '';

  setTitre(value) {
    titre = value;
    notifyListeners();
  }

  TextEditingController titileT = TextEditingController();

  TextEditingController minPriceT = TextEditingController();

  TextEditingController maxPriceT = TextEditingController();

  bool chargement = false;

  addDecaissement() async {
    chargement = true;
    notifyListeners();
    decaissement = await decaissementService.add({
      "title": titileT.text,
      "minPrice": int.parse(minPriceT.text),
      "maxPrice": int.parse(maxPriceT.text)
    });

    if (decaissement != null) {
      await getAllDecaissement();
    }
    chargement = false;
    notifyListeners();
  }

  updateDecaissement() async {
    chargement = true;
    notifyListeners();
    decaissement = await decaissementService.update(decaissement!.id!, {
      "title": titileT.text,
      "minPrice": int.parse(minPriceT.text),
      "maxPrice": int.parse(maxPriceT.text)
    });

    if (decaissement != null) {
      await getAllDecaissement();
    }
    chargement = false;
    notifyListeners();
  }

  delete(String id) async {
    decaissement = await decaissementService.delete(id);

    if (decaissement != null) {
      await getAllDecaissement();
    }
  }
}
