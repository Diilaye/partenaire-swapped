import 'package:flutter/material.dart';
import 'package:partenaire/models/commande-restaurant-model.dart';
import 'package:partenaire/services/restaurant-service.dart';

class AdminBloc with ChangeNotifier {
  int menu = 0;

  setMenu(int _menu) {
    menu = _menu;
    notifyListeners();
  }

  List<String> listeStatus = ["", "PENDING", "PREPARATION", "LIVRAISON"];

  String selectedStatus = "";

  setSelectedStatus(String value) {
    selectedStatus = value;
    notifyListeners();
  }

  RestaurantService restaurantService = RestaurantService();

  List<CommandeRestaurantModel>? listeCommandes;

  CommandeRestaurantModel? selectedCommande;

  setSelectedCommande(CommandeRestaurantModel? select) {
    selectedCommande = select;
    notifyListeners();
  }

  AdminBloc() {
    getAllCommandes();
  }

  getAllCommandes() async {
    listeCommandes = await restaurantService.getAdminCommande();

    notifyListeners();
  }

  updateStatusCommandePannier(
      CommandeRestaurantModel? select, String status) async {
    Map<String, dynamic> body = {"etatLivraison": status};
    String? resutl =
        await restaurantService.updateCommandePannier(select!.id!, body);
    if (resutl != null) {
      await getAllCommandes();
    }
  }
}
