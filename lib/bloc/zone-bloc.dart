import 'package:flutter/material.dart';
import 'package:partenaire/models/zone-model.dart';
import 'package:partenaire/services/zone-service.dart';

class ZoneBloc with ChangeNotifier {
  ZoneService zoneService = ZoneService();

  List<ZoneModel>? zones = [];

  ZoneModel? zone;
  getAllZone() async {
    zones = await zoneService.all();
    notifyListeners();
  }

  getOne(ZoneModel? zon) {
    zone = zon;
    tabTitleT = [];
    tabPrixT = [];
    notifyListeners();

    titreT.value = TextEditingValue(text: zone!.title!);

    for (var element in zone!.subZone!) {
      tabTitleT.add(TextEditingController(text: element.arrive!));
      tabPrixT.add(TextEditingController(text: element.prix!.toString()));
      // notifyListeners();
    }

    notifyListeners();
  }

  getOneSubZone(ZoneModel? zon) {
    zone = zon;

    titreT.value = const TextEditingValue(text: "");
    prix.value = const TextEditingValue(text: "");

    notifyListeners();
  }

  addSubZone() async {
    Map<String, dynamic> body = {
      "arrive": titreT.text,
      "prix": int.parse(prix.text)
    };
    zone = await zoneService.addSubZone(zone!.id!, body);

    if (zone != null) {
      await getAllZone();
    }
    notifyListeners();
  }

  ZoneBloc() {
    getAllZone();
  }

  String depart = '';

  setDepart(value) {
    depart = value;
    notifyListeners();
  }

  TextEditingController titreT = TextEditingController();
  TextEditingController prix = TextEditingController();

  List<TextEditingController> tabTitleT = [];
  List<TextEditingController> tabPrixT = [];

  bool chargement = false;

  addZone() async {
    chargement = true;
    notifyListeners();
    zone = await zoneService.add({
      "title": titreT.text,
    });
    print("zone");
    print(zone);
    if (zone != null) {
      await getAllZone();
    }
    chargement = false;
    notifyListeners();
  }

  updatezone() async {
    chargement = true;
    notifyListeners();
    zone = await zoneService.update(zone!.id!, {
      "title": titreT.text,
    });

    if (zone != null) {
      await getAllZone();
    }
    chargement = false;
    notifyListeners();
  }

  delete(String id) async {
    zone = await zoneService.delete(id);

    if (zone != null) {
      await getAllZone();
    }
  }

  completerZone() async {
    List<Map<String, dynamic>> sZone = [];
    int i = 0;

    for (var element in tabPrixT) {
      sZone.add({"arrive": tabTitleT[i].text, "prix": int.parse(element.text)});
      i++;
    }

    zone = await zoneService.update(zone!.id!, {"subZone": sZone});

    if (zone != null) {
      await getAllZone();
    }
  }
}
