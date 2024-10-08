import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:partenaire/models/commande-restaurant-model.dart';
import 'package:partenaire/models/offre-special-restaurant-model.dart';
import 'package:partenaire/models/plats-model.dart';
import 'package:partenaire/models/reservation-restaurant-model.dart';
import 'package:partenaire/services/restaurant-service.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/price-format.dart';

class AdminRestaurantBloc with ChangeNotifier {
  int menu = 0;

  List<String> listeStatus = ["", "PENDING", "PREPARATION", "LIVRAISON"];

  String selectedStatus = "";

  setSelectedStatus(String value) {
    selectedStatus = value;
    notifyListeners();
  }

  RestaurantService restaurantService = RestaurantService();

  List<PlatsRestaurantsModel> listes = [];

  List<OffreSpecialRestaurantsModel> listeOffres = [];

  List<ReservationRestaurantModel> listeReservations = [];

  List<CommandeRestaurantModel>? listeCommandes;

  CommandeRestaurantModel? selectedCommande;

  setSelectedCommande(CommandeRestaurantModel? select) {
    selectedCommande = select;
    notifyListeners();
  }

  AdminRestaurantBloc() {
    getAllCommandes();
    getAllReservation();
    getAllPlats();
    getAllOffres();
  }

  getAllCommandes() async {
    print("getAllCommandes");
    listeCommandes = await restaurantService.getCommande();

    notifyListeners();
    print(listeCommandes);
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
    print("getAllPlats");
    listes = await restaurantService.allPlatsRestaurants();
    print(listes.length);
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

  updateStatusCommandePannier(
      CommandeRestaurantModel? select, String status) async {
    Map<String, dynamic> body = {"etatLivraison": status};

    if (status == "LIVRAISON") {
      Map<String, dynamic> bodyLivraison = {
        "client": select!.client!.id!,
        "commande": select!.id!,
        "prix_total": priceFee(select.prixLivraison!),
        "prix_offre": select.prixLivraison!,
        "pointDepart": select.pointArrive!.toJson(),
        "pointArrive": select.pointDepart!.toJson(),
        "addresseDepart": select.addresseRestaurant!,
        "addresseArrive": select.addresseLivraion!
      };
      print("bodyLivraison");
      print(bodyLivraison);
      String? resultLivraison =
          await restaurantService.createLivraison(bodyLivraison);
      print(resultLivraison);
      if (resultLivraison != null) {
        String? resutl = await restaurantService
            .updateCommandePannier(select.id!, {"etatLivraison": "LIVRAISON"});
        if (resutl != null) {
          await getAllCommandes();
        }
      }
    } else {
      String? resutl =
          await restaurantService.updateCommandePannier(select!.id!, body);
      if (resutl != null) {
        await getAllCommandes();
      }
    }
  }
}
