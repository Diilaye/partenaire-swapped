import 'package:partenaire/models/biens-model.dart';
import 'package:partenaire/models/reservation-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

class ReservationService {
  Future<List<ReservationModel>> all() async {
    return await getResponse(url: '/reservations/logement').then((value) {
      return ReservationModel.fromList(data: value['data']);
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
}
