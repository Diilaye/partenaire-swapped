import 'package:flutter/material.dart';
import 'package:partenaire/models/partenaire-model.dart';
import 'package:partenaire/models/place-autocomplete-model.dart';
import 'package:partenaire/services/map-service.dart';
import 'package:partenaire/services/partenaire-service.dart';
import 'package:partenaire/utils/upload-file.dart';

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
    heureRV.text = "${value!.hour}h-${value.minute} min";
    notifyListeners();
  }

  setDateRv(DateTime? value) {
    dateRV.text = value!.toString();
    notifyListeners();
  }

  List<dynamic> photo1Exterieur = [null, null];
  List<dynamic> photo2Exterieur = [null, null];
  List<dynamic> photo1Interieur = [null, null];
  List<dynamic> photo2Interieur = [null, null];
  List<dynamic> photo3Interieur = [null, null];

  getPhoto1Exterieur() async {
    photo1Exterieur = await getImage(1);
    notifyListeners();
  }

  getPhoto2Exterieur() async {
    photo2Exterieur = await getImage(1);
    notifyListeners();
  }

  getPhoto1Interieur() async {
    photo1Interieur = await getImage(1);
    notifyListeners();
  }

  getPhoto2Interieur() async {
    photo2Interieur = await getImage(1);
    notifyListeners();
  }

  getPhoto3Interieur() async {
    photo3Interieur = await getImage(1);
    notifyListeners();
  }

  addPartenaireFunction() async {
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
    notifyListeners();
  }
}
