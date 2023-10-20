// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:partenaire/models/plats-model.dart';

final oCcy = NumberFormat("#,##0", "en_US");

String getFormatPrice(int value) {
  return oCcy.format(value);
}

String getAllPriceOffre(List<PlatsRestaurantsModel> liste,
    List<Map<String, dynamic>> complements, double pourcentage) {
  int price = 0;

  for (var element in liste) {
    price += element.tarif!;
  }
  for (var element in complements) {
    if (element['ctrl'].text != "") {
      price += int.parse(element['ctrlPrix'].text);
    }
  }

  price = (price * (1 - pourcentage)) as int;

  return oCcy.format(price);
}
