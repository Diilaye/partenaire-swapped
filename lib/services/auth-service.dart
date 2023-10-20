import 'package:partenaire/models/admin-user-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<AdminUserModel?> auth(Map<String, dynamic> body) async {
    // print(body);
    return await postResponse(url: '/admin-user/auth', body: body)
        .then((value) async {
      // print(value);
      if (value['status'] == 200) {
        AdminUserModel auth = AdminUserModel.fromJson(value['body']['data']);
        await SharedPreferences.getInstance().then((prefs) {
          prefs.setString('token', auth.token!);
          prefs.setString('role', auth.service!);
        });
        return auth;
      } else {
        return null;
      }
    });
  }

  Future<AdminUserModel?> getAuth() async {
    return await getResponse(url: '/admin-user/auth').then((value) async {
      // print(value);
      if (value['status'] == 200) {
        AdminUserModel auth = AdminUserModel.fromJson(value['body']['data']);
        return auth;
      } else {
        return null;
      }
    });
  }

  Future<String?> updateAuth(Map<String, dynamic> body) async {
    return await putResponse(url: '/admin-user/', body: body)
        .then((value) async {
      print(value);
      if (value['status'] == 200) {
        return "modification reussi";
      } else {
        return null;
      }
    });
  }
}
