import 'package:flutter/material.dart';
import 'package:partenaire/models/admin-user-model.dart';
import 'package:partenaire/services/auth-service.dart';

class SettingsBloc with ChangeNotifier {
  AdminUserModel? auth;

  AuthService authService = AuthService();

  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController telOM = TextEditingController();
  TextEditingController telMOMO = TextEditingController();
  TextEditingController identifiant = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController premierePorucentage = TextEditingController();
  TextEditingController premiereJour = TextEditingController();
  TextEditingController deuxiemePorucentage = TextEditingController();
  TextEditingController deuxiemeJour = TextEditingController();
  TextEditingController troisiemePorucentage = TextEditingController();
  TextEditingController troisiemeJour = TextEditingController();

  getUser() async {
    auth = await authService.getAuth();
    nom.text = auth!.nom!;
    prenom.text = auth!.prenom!;
    telOM.text = auth!.telephoneOM!;
    telMOMO.text = auth!.telephoneMOMO!;
    identifiant.text = auth!.identifiant!;
    email.text = auth!.email!;
    premierePorucentage.text = auth!.conditionAnulation!.first.pourcantage!;
    premiereJour.text = auth!.conditionAnulation!.first.jour!;
    deuxiemePorucentage.text = auth!.conditionAnulation![1].pourcantage!;
    deuxiemeJour.text = auth!.conditionAnulation![1].jour!;
    troisiemePorucentage.text = auth!.conditionAnulation![2].pourcantage!;
    troisiemeJour.text = auth!.conditionAnulation![2].jour!;

    notifyListeners();
  }

  bool viewPassword = true;

  setViewPassword() {
    viewPassword = !viewPassword;
    notifyListeners();
  }

  SettingsBloc() {
    getUser();
  }

  bool chargementProfile = false;

  updateProfile() async {
    chargementProfile = true;
    notifyListeners();
    Map<String, String> body = {
      "nom": nom.text,
      "prenom": prenom.text,
      "telephoneOM": telOM.text,
      "telephoneMOMO": telMOMO.text,
      "email": email.text,
      "password": password.text,
      "oldPassword": oldPassword.text
    };

    if (password.text.isEmpty || oldPassword.text.isEmpty) {
      body = {
        "nom": nom.text,
        "prenom": prenom.text,
        "telephoneOM": telOM.text,
        "telephoneMOMO": telMOMO.text,
        "email": email.text,
      };
    }

    String? result = await authService.updateAuth(body);
    if (result == "modification reussi") {
      getUser();
    }
    chargementProfile = false;

    notifyListeners();
  }

  bool chargementAnulation = false;

  updateAnulation() async {
    chargementAnulation = true;
    notifyListeners();
    Map<String, dynamic> body = {
      "conditionAnulation": [
        {"pourcantage": premierePorucentage.text, "jour": premiereJour.text},
        {"pourcantage": deuxiemePorucentage.text, "jour": deuxiemeJour.text},
        {"pourcantage": troisiemePorucentage.text, "jour": troisiemeJour.text},
      ]
    };

    String? result = await authService.updateAuth(body);
    if (result == "modification reussi") {
      getUser();
    }
    chargementAnulation = false;

    notifyListeners();
  }
}
