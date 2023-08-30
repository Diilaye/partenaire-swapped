import 'package:flutter/material.dart';
import 'package:partenaire/models/admin-user-model.dart';
import 'package:partenaire/services/auth-service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthBloc with ChangeNotifier {
  AuthService authService = AuthService();

  AdminUserModel? adminUserModel;

  bool viewPassword = true;

  bool chargement = false;

  setViewPassword() {
    viewPassword = !viewPassword;
    notifyListeners();
  }

  TextEditingController identifiant = TextEditingController();
  TextEditingController password = TextEditingController();

  loginFunction(BuildContext context) async {
    chargement = true;
    notifyListeners();

    adminUserModel = await authService
        .auth({"identifiant": identifiant.text, "password": password.text});

    if (adminUserModel != null) {
      Fluttertoast.showToast(
          msg: "Connection réussi",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webPosition: "center",
          webBgColor: "linear-gradient(to right, #2E8C1F, #2E8C1F)",
          fontSize: 14.0);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, "/");
    } else {
      Fluttertoast.showToast(
          msg: "identifiant incorrect ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webPosition: "center",
          webBgColor: "linear-gradient(to right, #9D0208, #9D0208)",
          fontSize: 14.0);
    }

    chargement = false;
    notifyListeners();
  }
}
