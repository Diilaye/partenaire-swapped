import 'package:partenaire/models/reservation-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

class ReservationService {
  Future<List<ReservationModel>> all() async {
    return await getResponse(url: '/reservations/logement').then((value) {
      return ReservationModel.fromList(data: value['body']['data']);
    });
  }

  Future<ReservationModel?> add(Map<String, dynamic> body) async {
    return await postResponse(url: '/reservations/prospect', body: body)
        .then((value) {
      print(value);
      if (value['status'] == 201) {
        return ReservationModel.fromJson(value['body']['data']);
      }
      return null;
    });
  }

  Future<String?> update(String id, Map<String, dynamic> body) async {
    print(body);
    return await putResponse(url: '/reservations/partenaires/$id', body: body)
        .then((value) {
      if (value['status'] == 200) {
        return "modification réussi";
      } else {
        return null;
      }
    });
  }
}
