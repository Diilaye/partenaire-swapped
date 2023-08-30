import 'package:partenaire/models/admin-user-model.dart';
import 'package:partenaire/utils/requette-by-dii.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<AdminUserModel?> auth(Map<String, dynamic> body) async {
    print(body);
    return await postResponse(url: '/admin-user/auth', body: body)
        .then((value) async {
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
}
