// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:partenaire/models/commande-restaurant-model.dart';
import 'package:partenaire/models/plats-model.dart';

final oCcy = NumberFormat("#,##0", "en_US");

String getFormatPrice(int value) {
  return oCcy.format(value);
}

String getAllPriceOffre(List<PlatsRestaurantsModel> liste,
    List<Map<String, dynamic>> complements, double pourcentage) {
  double price = 0;

  for (var element in liste) {
    price += element.tarif!;
  }
  for (var element in complements) {
    if (element['ctrl'].text != "") {
      price += double.parse(element['ctrlPrix'].text);
    }
  }

  price = (price * (1 - pourcentage));

  return oCcy.format(price.toInt());
}

String getAllMontant(List<CommandeRestaurantModel> listeCommandes) {
  int prix = 0;

  for (var element in listeCommandes) {
    prix = prix + element.prixOffre!;
  }
  return getFormatPrice(prix);
}
