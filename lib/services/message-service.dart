import 'package:partenaire/utils/requette-by-dii.dart';

class MessageService {
  Future<String?> add(Map<String, dynamic> body) async {
    return await postResponse(url: '/messages', body: body).then((value) {
      print(value);
      if (value['status'] == 201) {
        return "ajout réssui";
      } else {
        return null;
      }
    });
  }
}
