import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:partenaire/models/plats-model.dart';
import 'package:partenaire/services/restaurant-service.dart';
import 'package:partenaire/utils/upload-file.dart';

class AddPlatRestaurantBloc with ChangeNotifier {
  int menuAdd = 0;

  RestaurantService restaurantService = RestaurantService();

  PlatsRestaurantsModel? platsSelected;

  setPlatSelected(PlatsRestaurantsModel? select) {
    platsSelected = select;
    nom.text = platsSelected!.titre!;
    description.text = platsSelected!.description!;
    prix.text = platsSelected!.tarif!.toString();
    photoUpdate1 = [
      platsSelected!.galery![0].id,
      null,
      platsSelected!.galery![0].toJson()
    ];
    photoUpdate2 = [
      platsSelected!.galery![1].id,
      null,
      platsSelected!.galery![1].toJson()
    ];

    livrable = platsSelected!.isLivrable! == true ? 0 : 1;

    disponible = platsSelected!.isDisponible! == true ? 0 : 1;

    selectedMenu = platsSelected!.menu!;
    print("selectedMenu = platsSelected!.menu!");
    print(selectedMenu);
    print(platsSelected!.menu!);

    selectedSpecialite = listeSpecialite
        .firstWhere((e) => platsSelected!.specialite == e['titre']);

    int i = 1;

    listeComplement = [];

    platsSelected!.complements!.forEach((e) {
      listeComplement.add({
        "id": i.toString(),
        "supprimable": true,
        "label": "Nom complement ",
        "prix": "Prix complement (TTC) ",
        "ctrl": TextEditingController(text: e.name),
        "ctrlPrix": TextEditingController(text: e.prix.toString()),
      });
      i++;
    });

    listeComplement.insert(0, {
      "id": "0",
      "supprimable": false,
      "label": "Nom complement ",
      "prix": "Prix complement (TTC) ",
      "ctrl": TextEditingController(),
      "ctrlPrix": TextEditingController(),
    });

    notifyListeners();
  }

  setMenuAdd(int select) {
    if (select == 1) {
      if (nom.text.isEmpty ||
          prix.text.isEmpty ||
          photo1[0] == null ||
          photo2[0] == null) {
        select = 0;

        Fluttertoast.showToast(
            msg: "Veuillez saisir tous les champs",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            webPosition: "center",
            webBgColor: "linear-gradient(to right, #9D0208, #9D0208)",
            fontSize: 14.0);
      }
    }
    menuAdd = select;
    notifyListeners();
  }

  setMenuAUpdate(int select) {
    if (select == 1) {
      if (nom.text.isEmpty ||
          prix.text.isEmpty ||
          photoUpdate1[0] == null ||
          photoUpdate2[0] == null) {
        select = 0;

        Fluttertoast.showToast(
            msg: "Veuillez saisir tous les champs",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            webPosition: "center",
            webBgColor: "linear-gradient(to right, #9D0208, #9D0208)",
            fontSize: 14.0);
      }
    }
    menuAdd = select;
    notifyListeners();
  }

  int livrable = 0;

  setLivrable(int select) {
    livrable = select;
    notifyListeners();
  }

  int disponible = 0;

  setDisponibilte(int select) {
    disponible = select;
    notifyListeners();
  }

  TextEditingController nom = TextEditingController();
  TextEditingController prix = TextEditingController();
  TextEditingController description = TextEditingController();

  List<Map<String, dynamic>> listeComplement = [
    {
      "id": "0",
      "supprimable": false,
      "label": "Nom complement ",
      "prix": "Prix complement (TTC) ",
      "ctrl": TextEditingController(),
      "ctrlPrix": TextEditingController(),
    }
  ];

  setListeComplements() {
    listeComplement.add({
      "id": listeComplement.length.toString(),
      "supprimable": true,
      "label": "Nom complement ",
      "prix": "Prix complement (TTC)",
      "ctrl": TextEditingController(),
      "ctrlPrix": TextEditingController(),
    });
    notifyListeners();
  }

  removeComplements(String id) {
    listeComplement
        .removeWhere((element) => element['id'].toString() == id.toString());

    notifyListeners();
  }

  List<Map<String, String>> listeSpecialite = [
    {"url": "assets/images/africa.png", "titre": 'Africaine'},
    {"url": "assets/images/amerique.png", "titre": 'Américaine'},
    {"url": "assets/images/asiatique.png", "titre": 'Asiatique'},
    {"url": "assets/images/europeen.png", "titre": 'Européen'},
    {"url": "assets/images/oceanie.png", "titre": 'Oceanie'},
  ];

  Map<String, String> selectedSpecialite = {
    "url": "assets/images/africa.png",
    "titre": 'Africaine'
  };

  setSelectedSpecialite(Map<String, String> select) {
    selectedSpecialite = select;
    notifyListeners();
  }

  List<String> listeMenu = [
    "Petit dejeuner",
    "Dejeuner",
    "Happy hour",
    "Dinner"
  ];

  List<String> selectedMenu = ["Petit dejeuner"];

  setSelectedMenu(String value) {
    if (selectedMenu.contains(value)) {
      selectedMenu.remove(value);
    } else {
      selectedMenu.add(value);
    }
    notifyListeners();
  }

  List<dynamic> photo1 = [null, null];
  bool chargementPhoto1 = false;

  getPhoto1() async {
    chargementPhoto1 = true;
    notifyListeners();
    photo1 = await getImage(1);
    chargementPhoto1 = false;
    notifyListeners();
  }

  removePhoto1() async {
    chargementPhoto1 = false;
    photo1 = [null, null];
    notifyListeners();
  }

  List<dynamic> photo2 = [null, null];
  bool chargementPhoto2 = false;

  getPhoto2() async {
    chargementPhoto2 = true;
    notifyListeners();
    photo2 = await getImage(1);
    chargementPhoto2 = false;
    notifyListeners();
  }

  removePhoto2() async {
    chargementPhoto2 = false;
    photo2 = [null, null];
    notifyListeners();
  }

  List<dynamic> photoUpdate1 = [null, null, null];
  bool chargementPhotoUpdate1 = false;

  getPhotoUpdate1() async {
    chargementPhotoUpdate1 = true;
    notifyListeners();
    photoUpdate1 = await getImageModif(
        1, platsSelected!.galery![0].toJson(), platsSelected!.galery![0].id!);
    chargementPhotoUpdate1 = false;
    notifyListeners();
  }

  removePhotoUpadate1() async {
    chargementPhoto1 = false;
    photoUpdate1 = [null, null, null];
    notifyListeners();
  }

  List<dynamic> photoUpdate2 = [null, null, null];
  bool chargementPhotoUpdate2 = false;

  getPhotoUpdate2() async {
    chargementPhotoUpdate2 = true;
    notifyListeners();
    photoUpdate2 = await getImageModif(
        1, platsSelected!.galery![1].toJson(), platsSelected!.galery![1].id!);
    chargementPhotoUpdate2 = false;
    notifyListeners();
  }

  removePhotoUpadate2() async {
    chargementPhotoUpdate2 = false;
    photoUpdate2 = [null, null, null];
    notifyListeners();
  }

  bool chargementAddPlats = false;

  addPlats() async {
    chargementAddPlats = true;
    notifyListeners();
    Map<String, dynamic> body = {
      "galery": [photo1[0], photo2[0]],
      "titre": nom.text,
      "specialite": selectedSpecialite['titre'],
      "menu": selectedMenu,
      "complements": listeComplement
          .where((e) => e['ctrl'].text != "")
          .toList()
          .map((e) =>
              {"name": e['ctrl'].text, "prix": int.parse(e['ctrlPrix'].text)})
          .toList(),
      "description": description.text,
      "tarif": prix.text,
      "isLivraible": livrable == 0 ? true : false,
      "isDisponible": disponible == 0 ? true : false,
    };
    String? result = await restaurantService.addPlats(body);
    if (result != null) {
      Fluttertoast.showToast(
          msg: "plats ajouté avec succes",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webPosition: "center",
          webBgColor: "linear-gradient(to right, #2E8C1F, #2E8C1F)",
          fontSize: 14.0);
      resetData();
    }
    chargementAddPlats = false;
    notifyListeners();
  }

  bool chargementUpdatePlats = false;
  String? resultUpdate;
  updatePlats(context) async {
    chargementUpdatePlats = true;
    notifyListeners();
    Map<String, dynamic> body = {
      "galery": [photoUpdate1[0], photoUpdate2[0]],
      "titre": nom.text,
      "specialite": selectedSpecialite['titre'],
      "menu": selectedMenu,
      "complements": listeComplement
          .where((e) => e['ctrl'].text != "")
          .toList()
          .map((e) =>
              {"name": e['ctrl'].text, "prix": int.parse(e['ctrlPrix'].text)})
          .toList(),
      "description": description.text,
      "tarif": prix.text,
      "isLivraible": livrable == 0 ? true : false,
      "isDisponible": disponible == 0 ? true : false,
    };
    resultUpdate =
        await restaurantService.updatePlats(platsSelected!.id!, body);
    if (resultUpdate != null) {
      Fluttertoast.showToast(
          msg: "plats modifié avec succes",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webPosition: "center",
          webBgColor: "linear-gradient(to right, #2E8C1F, #2E8C1F)",
          fontSize: 14.0);

      Navigator.popAndPushNamed(context, "/");

      resetData();
    }
    chargementUpdatePlats = false;
    notifyListeners();
  }

  resetData() {
    menuAdd = 0;

    photo1 = [null, null];
    photo2 = [null, null];
    listeComplement = [
      {
        "id": "0",
        "supprimable": false,
        "label": "Nom complement ",
        "prix": "Prix complement (TTC) ",
        "ctrl": TextEditingController(),
        "ctrlPrix": TextEditingController(),
      }
    ];
    nom.text = "";
    selectedMenu = ["Petit dejeuner"];
    description.text = "";
    livrable = 0;
    disponible = 0;
    prix.text = "";
    selectedSpecialite = {
      "url": "assets/images/africa.png",
      "titre": 'Africaine'
    };

    notifyListeners();
  }
}
