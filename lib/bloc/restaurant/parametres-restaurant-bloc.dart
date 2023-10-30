import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:partenaire/models/place-autocomplete-model.dart';
import 'package:partenaire/models/restaurant-model.dart';
import 'package:partenaire/services/map-service.dart';
import 'package:partenaire/services/restaurant-service.dart';
import 'package:partenaire/utils/upload-file.dart';

class ParametresRestaurantBloc with ChangeNotifier {
  MapService mapService = MapService();

  RestaurantService restaurantService = RestaurantService();

  TextEditingController nom = TextEditingController();
  TextEditingController adresse = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController telephone1 = TextEditingController();
  TextEditingController telephone2 = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController ouvertureHeure = TextEditingController();
  TextEditingController fermetureHeure = TextEditingController();
  TextEditingController nombreTable = TextEditingController();

  Restaurantmodel? resto;

  getRestaurant() async {
    resto = await restaurantService.getResto();
    listeSpecialiteSelected = listeSpecialite
        // ignore: iterable_contains_unrelated_type
        .where((e) => resto!.specialite!.contains(e['id']))
        .toList();

    selectedCommodites = commodites
        // ignore: iterable_contains_unrelated_type
        .where((e) => resto!.commodite!.contains(e['commodite']))
        .toList();

    selectJour = jours
        // ignore: iterable_contains_unrelated_type
        .where((e) => resto!.jourOuvertures!.contains(e))
        .toList();

    nom.text = resto!.nomEntreprise!;
    description.text = resto!.descriptionEntreprise!;
    telephone.text = resto!.telephone!;
    telephone1.text = resto!.telephone1!;
    telephone2.text = resto!.telephone2!;
    telephone2.text = resto!.telephone2!;
    nombreTable.text = resto!.nombreTable!;
    adresse.text = resto!.adresse!;
    ouvertureHeure.text = resto!.heureOuverture!;
    fermetureHeure.text = resto!.heureFermeture!;
    photoCover = [resto!.photoCover!.id, null, resto!.photoCover!.toJson()];
    photo1 = [resto!.gallerie![0].id, null, resto!.gallerie![0].toJson()];
    photo2 = [resto!.gallerie![1].id, null, resto!.gallerie![1].toJson()];
    photo3 = [resto!.gallerie![2].id, null, resto!.gallerie![2].toJson()];
    photo4 = [resto!.gallerie![3].id, null, resto!.gallerie![3].toJson()];
    photo5 = [resto!.gallerie![4].id, null, resto!.gallerie![4].toJson()];
    notifyListeners();
  }

  List<Map<String, String>> commodites = [
    {
      "url": "assets/images/parking.jpg",
      "titre": 'Parking Gratuit',
      'commodite': "parking"
    },
    {
      "url": "assets/images/terasse.jpg",
      "titre": 'Térasse',
      'commodite': "terasse"
    },
    {
      "url": "assets/images/jardin.jpg",
      "titre": 'Jardin',
      'commodite': "jardin"
    },
    {
      "url": "assets/images/climatisateur.jpg",
      "titre": 'Climatiseur',
      'commodite': "climatiseur"
    },
    {
      "url": "assets/images/tv.jpg",
      "titre": 'Téléviseur',
      'commodite': "televiseur"
    },
    {
      "url": "assets/images/jeux-enfant.jpg",
      "titre": 'Jeux pour enfants',
      'commodite': "jeux-pour-enfants"
    },
    {
      "url": "assets/images/vue-eau2.jpg",
      "titre": 'Vue sur l\'eau',
      'commodite': "vue-sur-eau"
    },
    {"url": "assets/images/wifi.jpg", "titre": 'Wifi', 'commodite': "wifi"},
    {
      "url": "assets/images/traiteur.jpg",
      "titre": 'Traiteur',
      'commodite': "traiteur"
    },
  ];

  setSelectedCommodite(Map<String, String> select) {
    if (selectedCommodites.contains(select)) {
      selectedCommodites.remove(select);
    } else {
      selectedCommodites.add(select);
    }
    notifyListeners();
  }

  List<Map<String, String>> selectedCommodites = [];

  ParametresRestaurantBloc() {
    getRestaurant();
  }

  setFermeture(TimeOfDay? value) {
    if (value != null) {
      fermetureHeure.text =
          "${value.hour.toString().length > 1 ? value.hour : "0${value.hour}"}H:${value.minute.toString().length > 1 ? value.minute : "0${value.minute}"}";
    }
    notifyListeners();
  }

  setOuverture(TimeOfDay? value) {
    if (value != null) {
      ouvertureHeure.text =
          "${value.hour.toString().length > 1 ? value.hour : "0${value.hour}"}H:${value.minute.toString().length > 1 ? value.minute : "0${value.minute}"}";
    }

    notifyListeners();
  }

  List<PlaceAutocomplete> listePlaceAutocomplet = [];
  PlaceAutocomplete? placeSelected;

  selectPlaceSlected(PlaceAutocomplete place) {
    placeSelected = place;
    adresse.text = place.description!;
    listePlaceAutocomplet = [];
    notifyListeners();
  }

  setListePlaceAutocomplet() async {
    listePlaceAutocomplet =
        await mapService.adresseAutoComplet(adresse.text, resto!.pays!);
    notifyListeners();
  }

  List<dynamic> photoCover = [null, null, null];
  bool chargementPhotoCover = false;

  List<dynamic> photo1 = [null, null, null];
  bool chargement1Photo = false;
  List<dynamic> photo2 = [null, null, null];
  bool chargement2Photo = false;
  List<dynamic> photo3 = [null, null, null];
  bool chargement3Photo = false;
  List<dynamic> photo4 = [null, null, null];
  bool chargement4Photo = false;
  List<dynamic> photo5 = [null, null, null];
  bool chargement5Photo = false;

  getPhotoCover() async {
    chargementPhotoCover = true;
    notifyListeners();
    photoCover = await getImageModif(
        1, resto!.photoCover!.toJson(), resto!.photoCover!.id!);
    chargementPhotoCover = false;
    notifyListeners();
  }

  getPhoto1() async {
    chargement1Photo = true;
    notifyListeners();
    photo1 = await getImageModif(
        1, resto!.gallerie![0].toJson(), resto!.gallerie![0].id!);
    chargement1Photo = false;
    notifyListeners();
  }

  getPhoto2() async {
    chargement2Photo = true;
    notifyListeners();
    photo2 = await getImageModif(
        1, resto!.gallerie![1].toJson(), resto!.gallerie![1].id!);
    chargement2Photo = false;
    notifyListeners();
  }

  getPhoto3() async {
    chargement3Photo = true;
    notifyListeners();
    photo3 = await getImageModif(
        1, resto!.gallerie![2].toJson(), resto!.gallerie![2].id!);
    chargement3Photo = false;
    notifyListeners();
  }

  getPhoto4() async {
    chargement4Photo = true;
    notifyListeners();
    photo4 = await getImageModif(
        1, resto!.gallerie![3].toJson(), resto!.gallerie![3].id!);
    chargement4Photo = false;
    notifyListeners();
  }

  getPhoto5() async {
    chargement5Photo = true;
    notifyListeners();
    photo5 = await getImageModif(
        1, resto!.gallerie![4].toJson(), resto!.gallerie![4].id!);
    chargement5Photo = false;
    notifyListeners();
  }

  List<Map<String, String>> listeSpecialite = [
    {"url": "assets/images/africa.png", "titre": 'Africaine', "id": "africa"},
    {
      "url": "assets/images/amerique.png",
      "titre": 'Américaine',
      "id": "amerique"
    },
    {
      "url": "assets/images/asiatique.png",
      "titre": 'Asiatique',
      "id": "asiatique"
    },
    {
      "url": "assets/images/europeen.png",
      "titre": 'Européen',
      "id": "europeen"
    },
    {"url": "assets/images/oceanie.png", "titre": 'Oceanie', "id": "oceanie"},
  ];

  List<Map<String, String>> listeSpecialiteSelected = [];

  setListeSpecialiteSelected(Map<String, String> data) {
    if (listeSpecialiteSelected.contains(data)) {
      listeSpecialiteSelected.remove(data);
    } else {
      listeSpecialiteSelected.add(data);
    }
    notifyListeners();
  }

  List<String> jours = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
    'Dimanche'
  ];

  List<String> selectJour = [];

  setSlectedJour(String value) {
    if (selectJour.contains(value)) {
      selectJour.remove(value);
    } else {
      selectJour.add(value);
    }

    notifyListeners();
  }

  bool chargementModif = false;

  modiferRestaurant() async {
    chargementModif = true;
    notifyListeners();
    Map<String, dynamic> body = {
      "specialite": listeSpecialiteSelected.map((e) => e['id']).toList(),
      "adresse": adresse.text,
      "heureOuverture": ouvertureHeure.text,
      "heureFermeture": fermetureHeure.text,
      "jourOuvertures": selectJour,
      "nombreTable": nombreTable.text,
      "nomEntreprise": nom.text,
      "descriptionEntreprise": description.text,
      "telephone": telephone.text,
      "telephone1": telephone1.text,
      "telephone2": telephone2.text,
      "email": email.text,
      "photoCover": photoCover[0],
      "gallerie": [
        photo1[0],
        photo2[0],
        photo3[0],
        photo4[0],
        photo5[0],
      ],
      "commodite": selectedCommodites.map((e) => e['commodite']).toList(),
    };

    String? result = await restaurantService.updateResto(body);
    if (result != null) {
      Fluttertoast.showToast(
          msg: "Modification réussite",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webPosition: "center",
          webBgColor: "linear-gradient(to right, #2E8C1F, #2E8C1F)",
          fontSize: 14.0);
      getRestaurant();
    } else {
      Fluttertoast.showToast(
          msg: "Une erreur a été décellé",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webPosition: "center",
          webBgColor: "linear-gradient(to right, #9D0208, #9D0208)",
          fontSize: 14.0);
    }
    chargementModif = false;
    notifyListeners();
  }
}
