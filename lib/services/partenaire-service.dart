import 'package:partenaire/models/partenaire-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

class PartenaireService {
  Future<List<PartenaireModel>> all() async {
    return await getResponse(url: '/partenaires').then((value) {
      return PartenaireModel.fromList(data: value['body']['data']);
    });
  }

  Future<String?> getIdentifiant(String id) async {
    return await getResponse(url: '/partenaires/identifiant/$id').then((value) {
      if (value['status'] == 200) {
        return value['body']['data']['identifiant'];
      } else {
        return null;
      }
    });
  }

  Future<PartenaireModel?> add(Map<String, dynamic> body) async {
    return await postResponse(url: '/partenaires', body: body).then((value) {
      if (value['status'] == 200) {
        return PartenaireModel.fromJson(value['body']['data']);
      } else {
        return null;
      }
    });
  }

  Future<String?> addPartenaire(Map<String, dynamic> body) async {
    print(body);
    return await postResponse(url: '/partenaires/create-partenaire', body: body)
        .then((value) {
      if (value['status'] == 201) {
        return "success";
      } else {
        return null;
      }
    });
  }

  Future<String?> delete(String id) async {
    return await deleteResponse(
      url: '/partenaires/$id',
    ).then((value) {
      if (value['status'] == 200) {
        return "success";
      } else {
        return null;
      }
    });
  }
}
