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

  List<String> listeService = ["", "Logement", "Mobilite", "Restaurant"];
  String selectedService = "";

  List<String> listeStatus = ["", "active", "inactive"];
  String selectedStatus = "";

  setSelectedService(String value) {
    selectedService = value;
    notifyListeners();
  }

  setSelectedStatus(String value) {
    selectedStatus = value;
    notifyListeners();
  }

  List<PlaceAutocomplete> listePlaceAutocomplet = [];
  PlaceAutocomplete? placeSelected;
  String? deletePartenaire;

  PartenaireAdmonBloc() {
    getAllPartenaire();
  }

  String telSearch = "";

  setTelSearch(String value) {
    telSearch = value;
    notifyListeners();
  }

  filterListePartenaire(PartenaireModel element) {
    if (selectedService == "" && selectedStatus == "") {
      if (element.telephoneInterlocuteur!.contains(telSearch) ||
          telSearch == "") {
        return true;
      } else {
        return false;
      }
    } else if (selectedService == "" && selectedStatus != "") {
      if (element.telephoneInterlocuteur!.contains(telSearch) ||
          telSearch == "") {
        return element.status! == selectedStatus;
      } else {
        return false;
      }
    } else if (selectedService != "" && selectedStatus == "") {
      if (element.telephoneInterlocuteur!.contains(telSearch) ||
          telSearch == "") {
        return element.service! == selectedService.toLowerCase();
      } else {
        return false;
      }
    } else {
      if (element.telephoneInterlocuteur!.contains(telSearch) ||
          telSearch == "") {
        return (element.service! == selectedService.toLowerCase()) &&
            element.status! == selectedStatus;
      } else {
        return false;
      }
    }
  }

  setSelectPartenaire(PartenaireModel? part) async {
    print("part.toJson()");
    print(part!.photoExterieur!);
    print(part.photoInterne!);
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
      "nomEntreprise": nomEnreprise.text
    });
    print(successAddPartenaire);
    getAllPartenaire();

    savePartenairechargement = false;

    notifyListeners();
  }
}
