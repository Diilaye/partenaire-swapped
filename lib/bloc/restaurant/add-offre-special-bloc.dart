import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:partenaire/models/plats-model.dart';
import 'package:partenaire/services/restaurant-service.dart';
import 'package:partenaire/utils/upload-file.dart';

class AddOffreSpecialBloc with ChangeNotifier {
  RestaurantService restaurantService = RestaurantService();
  int addMenu = 0;

  setAddMenu(int select) {
    if (select == 1) {
      if (titre.text.isEmpty ||
          pourcentage.text.isEmpty ||
          dateEndCtrl.text.isEmpty ||
          dateOpenCtrl.text.isEmpty ||
          photo[0] == null ||
          selectedPlats.isEmpty) {
        Fluttertoast.showToast(
            msg: "Remplir tous les champs",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            webPosition: "center",
            webBgColor: "linear-gradient(to right, #9D0208, #9D0208)",
            fontSize: 14.0);
      } else {
        addMenu = 1;
      }
    } else {
      addMenu = select;
    }
    notifyListeners();
  }

  List<PlatsRestaurantsModel> selectedPlats = [];

  setSlectedPlats(PlatsRestaurantsModel select) {
    if (selectedPlats.contains(select)) {
      selectedPlats.remove(select);
    } else {
      selectedPlats.add(select);
    }
    notifyListeners();
  }

  TextEditingController pourcentage = TextEditingController();

  TextEditingController titre = TextEditingController();

  TextEditingController dateOpenCtrl = TextEditingController();

  TextEditingController dateEndCtrl = TextEditingController();

  DateTime? dateOpen;

  DateTime? dateEnd;

  List<dynamic> photo = [null, null];

  bool chargementPhoto = false;

  getPhoto() async {
    chargementPhoto = true;
    notifyListeners();
    photo = await getImage(1);
    chargementPhoto = false;
    notifyListeners();
  }

  removePhoto() async {
    chargementPhoto = false;
    photo = [null, null];
    notifyListeners();
  }

  setDateOpen(DateTime? date) {
    dateOpen = date;
    dateOpenCtrl.text =
        date!.toString().split(" ")[0].split("-").reversed.join("-");
    notifyListeners();
  }

  setDateEnd(DateTime? date) {
    dateEnd = date;
    dateEndCtrl.text =
        date!.toString().split(" ")[0].split("-").reversed.join("-");
    notifyListeners();
  }

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

  int livrable = 0;

  int disponible = 0;

  setDisponibilte(int select) {
    disponible = select;
    notifyListeners();
  }

  setLivrable(int select) {
    livrable = select;
    notifyListeners();
  }

  bool chargementAdd = false;

  addOffre(context) async {
    chargementAdd = true;
    notifyListeners();

    Map<String, dynamic> body = {
      "plats": selectedPlats.map((e) => e.id).toList(),
      "pourcentage": double.parse(pourcentage.text),
      "titre": titre.text,
      "dateDebut": dateOpen!.toIso8601String(),
      "dateFin": dateEnd!.toIso8601String(),
      "galery": photo[0],
      "complements": listeComplement
          .where((e) => e['ctrl'].text != "")
          .toList()
          .map((e) =>
              {"name": e['ctrl'].text, "prix": int.parse(e['ctrlPrix'].text)})
          .toList(),
      "isLivraible": livrable == 0 ? true : false,
      "isDisponible": disponible == 0 ? true : false,
    };

    String? result = await restaurantService.addOffreSpecialMenu(body);

    if (result != null) {
      Fluttertoast.showToast(
          msg: "offres ajoutées avec succes",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webPosition: "center",
          webBgColor: "linear-gradient(to right, #2E8C1F, #2E8C1F)",
          fontSize: 14.0);

      resetData();

      Navigator.popAndPushNamed(context, "/");
    }

    chargementAdd = false;
    notifyListeners();
  }

  resetData() {
    selectedPlats = [];
    addMenu = 0;
    photo = [null, null];
    livrable = 0;
    disponible = 0;
    pourcentage.text = "";
    titre.text = "";
    dateEndCtrl.text = "";
    dateOpenCtrl.text = "";
    dateEnd = null;
    dateOpen = null;
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
    notifyListeners();
  }
}
