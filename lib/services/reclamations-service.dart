import 'package:partenaire/models/find-vehicule-model.dart';
import 'package:partenaire/models/reclamation-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

class ReclamationService {
  Future<List<ReclamationModel>> all() async {
    return await getResponse(url: '/reclamations').then((value) {
      return ReclamationModel.fromList(data: value['body']['data']);
    });
  }

  Future<List<FindVehiculeModel>> proxyVehicule(
      String arrive, String pays) async {
    return await getResponse(
            url: '/reclamations/vehicules?pays=$pays&arrive=$arrive')
        .then((value) {
      return FindVehiculeModel.fromList(data: value['body']['data']);
    });
  }

  Future<String?> updateReclamation(
      String id, Map<String, dynamic> body) async {
    return putResponse(url: '/reclamations/$id', body: body).then((value) {
      if (value['value'] == 200) {
        return 'update modif';
      }
      return null;
    });
  }
}
