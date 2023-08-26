import 'package:partenaire/models/partenaire-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

class PartenaireService {
  Future<List<PartenaireModel>> adresseAutoComplet(String value) async {
    return await getResponse(url: '/partenaires').then((value) {
      return PartenaireModel.fromList(data: value['data']);
    });
  }

  Future<PartenaireModel?> add(Map<String, dynamic> body) async {
    return await postResponse(url: '/partenaires', body: body).then((value) {
      if (value['status'] == 201) {
        return PartenaireModel.fromJson(value['data']);
      } else {
        return null;
      }
    });
  }
}
