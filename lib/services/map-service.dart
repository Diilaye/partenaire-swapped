import 'package:partenaire/models/place-autocomplete-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

class MapService {
  Future<List<PlaceAutocomplete>> adresseAutoComplet(String value) async {
    return await getResponse(url: '/maps/places?input=$value').then((value) {
      return PlaceAutocomplete.fromList(data: value['data']);
    });
  }
}
