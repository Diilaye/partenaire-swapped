import 'package:partenaire/models/course-model.dart';
import 'package:partenaire/models/depense-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

class CourseService {
  Future<List<CourseModel>> all() async {
    return await getResponse(url: '/courses').then((value) {
      return CourseModel.fromList(data: value['body']['data']);
    });
  }

  Future<List<DepenseDashbordModel>> allLivraison(String dD, String dF) async {
    return await getResponse(url: '/depenses?from=$dD&to=$dF').then((value) {
      return DepenseDashbordModel.fromList(data: value['body']['data']);
    });
  }
}
