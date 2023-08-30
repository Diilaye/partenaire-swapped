import 'package:flutter/material.dart';
import 'package:partenaire/models/partenaire-model.dart';
import 'package:partenaire/models/place-autocomplete-model.dart';
import 'package:partenaire/services/map-service.dart';
import 'package:partenaire/services/partenaire-service.dart';
import 'package:partenaire/utils/upload-file.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PartenairesBloc with ChangeNotifier {
  MapService mapService = MapService();
  PartenaireService partenaireService = PartenaireService();

  PartenaireModel? partenaireModel;

  int addPartenaire = 0;

  List<PlaceAutocomplete> listePlaceAutocomplet = [];
  PlaceAutocomplete? placeSelected;

  selectPlaceSlected(PlaceAutocomplete place) {
    placeSelected = place;
    geolocatisationEntreprise.text = place.description!;
    listePlaceAutocomplet = [];
    notifyListeners();
  }

  setListePlaceAutocomplet() async {
    listePlaceAutocomplet =
        await mapService.adresseAutoComplet(geolocatisationEntreprise.text);
    notifyListeners();
  }

  setAddPartenaire() {
    if (addPartenaire == 0) {
      addPartenaire = 1;
    } else {
      addPartenaire = 0;
    }
    notifyListeners();
  }

  TextEditingController nomEnreprise = TextEditingController();

  List<String> listeService = ["", "Logement", "Mobilité", "Restaurant"];

  String selectedService = "";
  TextEditingController presentationEnreprise = TextEditingController();
  TextEditingController nomInterlocuteurEnreprise = TextEditingController();
  TextEditingController prenomInterlocuteurEnreprise = TextEditingController();
  TextEditingController telephoneInterlocuteurEnreprise =
      TextEditingController();

  TextEditingController descriptifEnreprise = TextEditingController();
  TextEditingController descriptifService = TextEditingController();
  TextEditingController geolocatisationEntreprise = TextEditingController();
  TextEditingController dateRV = TextEditingController();
  TextEditingController heureRV = TextEditingController();

  setSelectedService(String value) {
    selectedService = value;
    notifyListeners();
  }

  setHeureRv(TimeOfDay? value) {
    heureRV.text = "${value!.hour}h-${value.minute}min";
    notifyListeners();
  }

  setDateRv(DateTime? value) {
    dateRV.text = value!.toString().split(" ")[0].split("-").reversed.join("-");
    notifyListeners();
  }

  List<dynamic> photo1Exterieur = [null, null];
  bool chargement1PhotoExterieur = false;
  List<dynamic> photo2Exterieur = [null, null];
  bool chargement2PhotoExterieur = false;
  List<dynamic> photo1Interieur = [null, null];
  bool chargement1PhotoInterieur = false;
  List<dynamic> photo2Interieur = [null, null];
  bool chargement2PhotoInterieur = false;
  List<dynamic> photo3Interieur = [null, null];
  bool chargement3PhotoInterieur = false;

  getPhoto1Exterieur() async {
    chargement1PhotoExterieur = true;
    notifyListeners();
    photo1Exterieur = await getImage(1);
    chargement1PhotoExterieur = false;
    notifyListeners();
  }

  getPhoto2Exterieur() async {
    chargement2PhotoExterieur = true;
    notifyListeners();
    photo2Exterieur = await getImage(1);
    chargement2PhotoExterieur = false;

    notifyListeners();
  }

  getPhoto1Interieur() async {
    chargement1PhotoInterieur = true;
    notifyListeners();
    photo1Interieur = await getImage(1);
    chargement1PhotoInterieur = false;
    notifyListeners();
  }

  getPhoto2Interieur() async {
    chargement2PhotoInterieur = true;
    notifyListeners();
    photo2Interieur = await getImage(1);
    chargement2PhotoInterieur = false;
    notifyListeners();
  }

  getPhoto3Interieur() async {
    chargement3PhotoInterieur = true;
    notifyListeners();
    photo3Interieur = await getImage(1);
    chargement3PhotoInterieur = false;
    notifyListeners();
  }

  bool chargement = false;
  addPartenaireFunction() async {
    chargement = true;
    notifyListeners();
    Map<String, dynamic> body = {
      "service": selectedService.toLowerCase(),
      "nomEntreprise": nomEnreprise.text,
      "descriptionEntreprise": descriptifEnreprise.text,
      "nomInterlocuteur": nomInterlocuteurEnreprise.text,
      "prenomInterlocuteur": prenomInterlocuteurEnreprise.text,
      "telephoneInterlocuteur": telephoneInterlocuteurEnreprise.text,
      "photoExterieur": [photo1Exterieur.first, photo2Exterieur.first],
      "photoInterne": [
        photo1Interieur.first,
        photo2Interieur.first,
        photo3Interieur.first
      ],
      "localisation": geolocatisationEntreprise.text,
      "dateRv": dateRV.text,
      "heureRv": heureRV.text,
    };

    if (nomEnreprise.text.isEmpty ||
        descriptifEnreprise.text.isEmpty ||
        nomInterlocuteurEnreprise.text.isEmpty ||
        prenomInterlocuteurEnreprise.text.isEmpty ||
        telephoneInterlocuteurEnreprise.text.isEmpty ||
        photo1Exterieur.first == null ||
        photo2Exterieur.first == null ||
        photo1Interieur.first == null ||
        photo2Interieur.first == null ||
        photo3Interieur.first == null) {
      Fluttertoast.showToast(
          msg: "Veuillez  remplir tous les champs ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webPosition: "center",
          webBgColor: "linear-gradient(to right, #9D0208, #9D0208)",
          fontSize: 14.0);
    } else {
      partenaireModel = await partenaireService.add(body);

      if (partenaireModel != null) {
        selectedService = "";

        presentationEnreprise.text = "";
        nomInterlocuteurEnreprise.text = "";
        prenomInterlocuteurEnreprise.text = "";
        telephoneInterlocuteurEnreprise.text = "";

        descriptifEnreprise.text = "";
        descriptifService.text = "";
        geolocatisationEntreprise.text = "";
        dateRV.text = "";
        heureRV.text = "";

        photo1Exterieur = [null, null];
        photo2Exterieur = [null, null];
        photo1Interieur = [null, null];
        photo2Interieur = [null, null];
        photo3Interieur = [null, null];
      }
    }

    chargement = false;
    notifyListeners();
  }
}
