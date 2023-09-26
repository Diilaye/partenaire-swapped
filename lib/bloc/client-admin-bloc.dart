import 'package:flutter/material.dart';
import 'package:partenaire/models/client-model.dart';
import 'package:partenaire/services/cient-service.dart';

class ClientAdminBloc with ChangeNotifier {
  List<ClientModel>? clients;

  ClientService clientService = ClientService();

  getAllClient() async {
    clients = await clientService.getAll();
    notifyListeners();
  }

  String telSearch = "";

  setTelSearch(String value) {
    telSearch = value;
    notifyListeners();
  }

  bool filterParTel(ClientModel e) {
    if (telSearch == "") {
      return true;
    } else {
      if (e.telephoneMOMO!.contains(telSearch) ||
          e.telephoneOM!.contains(telSearch)) {
        return true;
      } else {
        return false;
      }
    }
  }

  ClientAdminBloc() {
    getAllClient();
  }
}
