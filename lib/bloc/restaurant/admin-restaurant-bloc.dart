import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:partenaire/models/offre-special-restaurant-model.dart';
import 'package:partenaire/models/plats-model.dart';
import 'package:partenaire/models/reservation-restaurant-model.dart';
import 'package:partenaire/services/restaurant-service.dart';
import 'package:partenaire/utils/colors-by-dii.dart';

class AdminRestaurantBloc with ChangeNotifier {
  int menu = 0;

  RestaurantService restaurantService = RestaurantService();

  List<PlatsRestaurantsModel> listes = [];

  List<OffreSpecialRestaurantsModel> listeOffres = [];

  List<ReservationRestaurantModel> listeReservations = [];

  AdminRestaurantBloc() {
    getAllReservation();
    getAllPlats();
    getAllOffres();
  }

  getAllReservation() async {
    print("getAllReservation");
    listeReservations = await restaurantService.getAllReservation();
    print("listeReservations");
    print(listeReservations.length);

    notifyListeners();
  }

  validReservation(String id) async {
    String? result = await restaurantService
        .updateReservation(id, {"statusRes": "valide-restaurant"});

    if (result != null) {
      Fluttertoast.showToast(
          msg: "Réservation modifié avec success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: vert,
          textColor: Colors.white,
          fontSize: 12.0);
      getAllReservation();
    } else {
      Fluttertoast.showToast(
          msg: "erreur survenue",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: vert,
          textColor: Colors.white,
          fontSize: 12.0);
    }
    notifyListeners();
  }

  anullerReservation(String id) async {
    String? result = await restaurantService
        .updateReservation(id, {"statusRes": "annuler-restaurant"});

    if (result != null) {
      Fluttertoast.showToast(
          msg: "Réservation annulée avec success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: vert,
          textColor: Colors.white,
          fontSize: 12.0);
      getAllReservation();
    } else {
      Fluttertoast.showToast(
          msg: "erreur survenue",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: vert,
          textColor: Colors.white,
          fontSize: 12.0);
    }
    notifyListeners();
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
