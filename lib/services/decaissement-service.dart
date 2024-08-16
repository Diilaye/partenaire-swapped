import 'package:partenaire/models/decaissement-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

class DecaissementService {
  Future<List<DecaissementModel>> all() async {
    return await getResponse(url: '/decaissements').then((value) {
      return DecaissementModel.fromList(data: value['body']['data']);
    });
  }

  Future<DecaissementModel?> update(
      String id, Map<String, dynamic> body) async {
    return putResponse(url: '/decaissements/$id', body: body).then((value) {
      if (value['status'] == 200) {
        return DecaissementModel.fromJson(value['body']['data']);
      }
      return null;
    });
  }

  Future<DecaissementModel?> add(Map<String, dynamic> body) async {
    return postResponse(url: '/decaissements/', body: body).then((value) {
      // print(value);
      if (value['status'] == 201) {
        return DecaissementModel.fromJson(value['body']['data']);
      }
      return null;
    });
  }

  Future<DecaissementModel?> delete(String id) async {
    return deleteResponse(url: '/decaissements/$id').then((value) {
      print(value);
      if (value['status'] == 200) {
        return DecaissementModel.fromJson(value['body']);
      }
      return null;
    });
  }
}
