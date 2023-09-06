import 'package:flutter/material.dart';
import 'package:partenaire/models/partenaire-model.dart';
import 'package:partenaire/models/place-autocomplete-model.dart';
import 'package:partenaire/services/map-service.dart';
import 'package:partenaire/services/partenaire-service.dart';

class PartenaireAdmonBloc with ChangeNotifier {
  MapService mapService = MapService();

  List<PartenaireModel>? listePartenaire;

  PartenaireModel? partenaire;
  bool chargement = false;

  TextEditingController nomEnreprise = TextEditingController();

  TextEditingController presentationEnreprise = TextEditingController();
  TextEditingController nomInterlocuteurEnreprise = TextEditingController();
  TextEditingController prenomInterlocuteurEnreprise = TextEditingController();
  TextEditingController telephoneInterlocuteurEnreprise =
      TextEditingController();

  PartenaireService partenaireService = PartenaireService();

  List<PlaceAutocomplete> listePlaceAutocomplet = [];
  PlaceAutocomplete? placeSelected;
  String? deletePartenaire;

  PartenaireAdmonBloc() {
    getAllPartenaire();
  }

  setSelectPartenaire(PartenaireModel? part) async {
    partenaire = part;
    nomEnreprise.text = partenaire!.nomEntreprise!;
    nomInterlocuteurEnreprise.text = partenaire!.nomInterlocuteur!;
    prenomInterlocuteurEnreprise.text = partenaire!.prenomInterlocuteur!;
    telephoneInterlocuteurEnreprise.text = partenaire!.telephoneInterlocuteur!;
    presentationEnreprise.text = partenaire!.descriptionEntreprise!;
    notifyListeners();
  }

  getAllPartenaire() async {
    listePartenaire = await partenaireService.all();
    notifyListeners();
  }

  deletePartenaireFun(String id) async {
    deletePartenaire = await partenaireService.delete(id);
    print(" deletePartenaireFun(String id) ");
    print(deletePartenaire);
    getAllPartenaire();
    notifyListeners();
  }

  String? successAddPartenaire;
  bool savePartenairechargement = false;

  addPartenaireFun(PartenaireModel partenaire) async {
    savePartenairechargement = true;
    notifyListeners();
    successAddPartenaire = await partenaireService.addPartenaire({
      "id": partenaire.id!,
      "service": partenaire.service,
      "nom": partenaire.nomInterlocuteur,
      "prenom": partenaire.prenomInterlocuteur,
      "nomEntreprise": partenaire.nomEntreprise
    });
    print(successAddPartenaire);
    getAllPartenaire();

    savePartenairechargement = false;

    notifyListeners();
  }
}
