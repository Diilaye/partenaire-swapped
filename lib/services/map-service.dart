import 'package:partenaire/models/place-autocomplete-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

class MapService {
  Future<List<PlaceAutocomplete>> adresseAutoComplet(
      String value, String pays) async {
    return await getResponse(url: '/maps/places?input=$value&pays=$pays')
        .then((value) {
      return PlaceAutocomplete.fromList(data: value['body']['data']);
    });
  }
}
