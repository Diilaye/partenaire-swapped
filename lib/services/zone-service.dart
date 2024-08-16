import 'package:partenaire/models/zone-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

class ZoneService {
  Future<List<ZoneModel>> all() async {
    return await getResponse(url: '/zones').then((value) {
      return ZoneModel.fromList(data: value['body']['data']);
    });
  }

  Future<ZoneModel?> update(String id, Map<String, dynamic> body) async {
    return putResponse(url: '/zones/$id', body: body).then((value) {
      if (value['status'] == 200) {
        return ZoneModel.fromJson(value['body']['data']);
      }
      return null;
    });
  }

  Future<ZoneModel?> addSubZone(String id, Map<String, dynamic> body) async {
    return putResponse(url: '/zones/subzone/$id', body: body).then((value) {
      if (value['status'] == 200) {
        return ZoneModel.fromJson(value['body']['data']);
      }
      return null;
    });
  }

  Future<ZoneModel?> add(Map<String, dynamic> body) async {
    return postResponse(url: '/zones/', body: body).then((value) {
      // print(value);
      if (value['status'] == 201) {
        return ZoneModel.fromJson(value['body']['data']);
      }
      return null;
    });
  }

  Future<ZoneModel?> delete(String id) async {
    return deleteResponse(url: '/zones/$id').then((value) {
      print(value);
      if (value['status'] == 200) {
        return ZoneModel.fromJson(value['body']);
      }
      return null;
    });
  }
}
