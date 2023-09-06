import 'package:partenaire/models/logement-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

class LogementService {
  Future<LogementModel?> add(Map<String, dynamic> body) async {
    return await postResponse(url: '/biens', body: body).then((value) {
      if (value['status'] == 201) {
        return LogementModel.fromJson(value['body']['data']);
      } else {
        return null;
      }
    });
  }
}
