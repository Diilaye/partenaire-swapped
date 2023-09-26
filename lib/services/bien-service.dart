import 'package:partenaire/models/biens-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

class BienService {
  Future<List<BiensModels>> all() async {
    return await getResponse(url: '/biens/user').then((value) {
      return BiensModels.fromList(data: value['body']['data']);
    });
  }

  Future<BiensModels?> add(Map<String, dynamic> body) async {
    return await postResponse(url: '/biens', body: body).then((value) {
      if (value['status'] == 201) {
        return BiensModels.fromJson(value['body']['data']);
      } else {
        return null;
      }
    });
  }

  Future<BiensModels?> update(String id, Map<String, dynamic> body) async {
    return await putResponse(url: '/biens/$id', body: body).then((value) {
      print(value);
      if (value['status'] == 200) {
        return BiensModels.fromJson(value['body']['data']);
      } else {
        return null;
      }
    });
  }
}
