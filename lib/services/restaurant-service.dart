import 'package:partenaire/models/commande-restaurant-model.dart';
import 'package:partenaire/models/offre-special-restaurant-model.dart';
import 'package:partenaire/models/plats-model.dart';
import 'package:partenaire/models/reservation-restaurant-model.dart';
import 'package:partenaire/models/restaurant-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

class RestaurantService {
  Future<Restaurantmodel?> getResto() async {
    return getResponse(url: "/restaurants").then((value) {
      // print(value);
      if (value['status'] == 200) {
        return Restaurantmodel.fromJson(value['body']['data']);
      }
      return null;
    });
  }

  Future<String?> updateResto(Map<String, dynamic> body) async {
    return putResponse(url: '/restaurants', body: body).then((value) {
      if (value['status'] == 200) {
        return "modification réussi";
      }
      return null;
    });
  }

  Future<String?> addPlats(Map<String, dynamic> body) async {
    return postResponse(url: '/plats', body: body).then((value) {
      if (value['status'] == 201) {
        return "Ajout réussi";
      }
      return null;
    });
  }

  Future<String?> updatePlats(String id, Map<String, dynamic> body) async {
    return putResponse(url: '/plats/$id', body: body).then((value) {
      print(value);
      if (value['status'] == 200) {
        return "modifications réussi";
      }
      return null;
    });
  }

  Future<List<PlatsRestaurantsModel>> allPlatsRestaurants() async {
    return getResponse(url: '/plats/byRestaurant').then((value) {
      // print(value);
      if (value['status'] == 200) {
        return PlatsRestaurantsModel.fromList(data: value['body']['data']);
      }
      return [];
    });
  }

  Future<String?> addOffreSpecialMenu(Map<String, dynamic> body) {
    // print(body);
    return postResponse(url: '/special-offres', body: body).then((value) {
      // print(value);
      if (value['status'] == 201) {
        return 'ajout réussi';
      } else {
        return null;
      }
    });
  }

  Future<List<OffreSpecialRestaurantsModel>> getOffreSpecialMenu() {
    return getResponse(url: '/special-offres/byRestaurant').then((value) {
      // print(value);
      if (value['status'] == 200) {
        return OffreSpecialRestaurantsModel.fromList(
            data: value['body']['data']);
      } else {
        return [];
      }
    });
  }

  Future<List<ReservationRestaurantModel>> getAllReservation() async {
    return getResponse(url: '/reservations-restaurant/byRestaurant')
        .then((value) {
      if (value['status'] == 200) {
        return ReservationRestaurantModel.fromList(data: value['body']['data']);
      }
      return [];
    });
  }

  Future<String?> updateReservation(
      String id, Map<String, dynamic> body) async {
    return putResponse(url: '/reservations-restaurant/$id', body: body)
        .then((value) {
      if (value['status'] == 200) {
        return "modification reussi";
      }
      return null;
    });
  }

  Future<List<CommandeRestaurantModel>> getCommande() async {
    return getResponse(url: '/pannier-commande/restaurant').then((value) {
      if (value['status'] == 201) {
        return CommandeRestaurantModel.fromList(data: value['body']['data']);
      }
      return [];
    });
  }

  Future<List<CommandeRestaurantModel>> getAdminCommande() async {
    return getResponse(url: '/pannier-commande/').then((value) {
      if (value['status'] == 201) {
        return CommandeRestaurantModel.fromList(data: value['body']['data']);
      }
      return [];
    });
  }

  Future<String?> updateCommandePannier(
      String id, Map<String, dynamic> body) async {
    print(body);
    return putResponse(url: '/pannier-commande/$id', body: body).then((value) {
      print(value);
      if (value['status'] == 201) {
        return "modification reussi";
      }
      return null;
    });
  }

  Future<String?> createLivraison(Map<String, dynamic> body) async {
    return postResponse(url: '/courses/livraison', body: body).then((value) {
      print("createLivraison postResponse");
      print(value);
      if (value['status'] == 201) {
        return "livraision initiié avec reussi";
      }
      return null;
    });
  }
}
