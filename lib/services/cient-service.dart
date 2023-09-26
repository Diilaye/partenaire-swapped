import 'package:partenaire/models/client-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

class ClientService {
  Future<List<ClientModel>?> getAll() async {
    return getResponse(url: '/clients').then((value) {
      if (value['status'] == 200) {
        return ClientModel.fromList(data: value['body']['data']);
      }
      return null;
    });
  }
}
