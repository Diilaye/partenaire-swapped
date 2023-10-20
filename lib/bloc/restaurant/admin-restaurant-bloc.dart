import 'package:flutter/material.dart';
import 'package:partenaire/models/offre-special-restaurant-model.dart';
import 'package:partenaire/models/plats-model.dart';
import 'package:partenaire/services/restaurant-service.dart';

class AdminRestaurantBloc with ChangeNotifier {
  int menu = 0;

  RestaurantService restaurantService = RestaurantService();

  List<PlatsRestaurantsModel> listes = [];

  List<OffreSpecialRestaurantsModel> listeOffres = [];

  AdminRestaurantBloc() {
    getAllPlats();
    getAllOffres();
  }

  getAllPlats() async {
    listes = await restaurantService.allPlatsRestaurants();
    notifyListeners();
  }

  getAllOffres() async {
    listeOffres = await restaurantService.getOffreSpecialMenu();
    notifyListeners();
  }

  setMenu(int _menu) {
    menu = _menu;
    notifyListeners();
  }

  int menuParams = 0;

  setMenuParam(int select) {
    menuParams = select;
    notifyListeners();
  }
}
