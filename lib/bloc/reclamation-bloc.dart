import 'package:flutter/material.dart';
import 'package:partenaire/models/find-vehicule-model.dart';
import 'package:partenaire/models/reclamation-model.dart';
import 'package:partenaire/services/reclamations-service.dart';

class ReclamationBloc with ChangeNotifier {
  List<ReclamationModel> reclamations = [];
  List<FindVehiculeModel>? vehicules;

  ReclamationModel? reclamationSelected;

  ReclamationService reclamationService = ReclamationService();

  TextEditingController problemeLogement = TextEditingController();
  TextEditingController solutionLogement = TextEditingController();

  getListVehicule() async {
    if (reclamationSelected!.obect!.commande == null) {
      vehicules = await reclamationService.proxyVehicule(
          reclamationSelected!.obect!.addresseDepart!, 'gn');
      notifyListeners();
    } else {
      vehicules = await reclamationService.proxyVehicule(
          reclamationSelected!.obect!.commande!.addresseRestaurant!, 'gn');
      notifyListeners();
    }
  }

  String? resultUpdate;

  bool chargementUpdateReclamations = false;
  updateReclamations() async {
    chargementUpdateReclamations = true;
    notifyListeners();

    Map<String, dynamic> body = {
      "probleme": problemeLogement.text,
      "solution": solutionLogement.text
    };

    resultUpdate = await reclamationService.updateReclamation(
        reclamationSelected!.id!, body);

    chargementUpdateReclamations = false;
    notifyListeners();

    if (resultUpdate != null) {
      getAllReclamations();
    }
  }

  setVehiculeNull() async {
    vehicules = null;
    notifyListeners();
  }

  getAllReclamations() async {
    reclamations = await reclamationService.all();
    notifyListeners();
  }

  setReclamationSelected(ReclamationModel? reclamation) {
    reclamationSelected = reclamation;
    notifyListeners();
  }

  ReclamationBloc() {
    getAllReclamations();
  }

  List<String> listeService = ['', 'mobilite', 'restaurant', 'logement'];
  String selectedService = "";

  List<String> listeStatus = ['', 'pending', 'call-client', 'finish'];
  String selectedStatus = "";

  setSelectedService(String value) {
    selectedService = value;
    notifyListeners();
  }

  setSelectedStatus(String value) {
    selectedStatus = value;
    notifyListeners();
  }

  String telSearch = "";

  setTelSearch(String value) {
    telSearch = value;
    notifyListeners();
  }

  filterListeReclamation(ReclamationModel element) {
    if (selectedService == "" && selectedStatus == "") {
      if (element.ticketReclamation!.contains(telSearch) || telSearch == "") {
        return true;
      } else {
        return false;
      }
    } else if (selectedService == "" && selectedStatus != "") {
      if (element.ticketReclamation!.contains(telSearch) || telSearch == "") {
        return element.statusReclamation! == selectedStatus;
      } else {
        return false;
      }
    } else if (selectedService != "" && selectedStatus == "") {
      if (element.ticketReclamation!.contains(telSearch) || telSearch == "") {
        return element.typeService! == selectedService.toLowerCase();
      } else {
        return false;
      }
    } else {
      if (element.ticketReclamation!.contains(telSearch) || telSearch == "") {
        return (element.typeService! == selectedService.toLowerCase()) &&
            element.statusReclamation! == selectedStatus;
      } else {
        return false;
      }
    }
  }
}
