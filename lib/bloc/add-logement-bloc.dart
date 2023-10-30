import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:partenaire/models/admin-user-model.dart';
import 'package:partenaire/models/biens-model.dart';
import 'package:partenaire/models/place-autocomplete-model.dart';
import 'package:partenaire/services/auth-service.dart';
import 'package:partenaire/services/bien-service.dart';
import 'package:partenaire/services/logement-service.dart';
import 'package:partenaire/services/map-service.dart';
import 'package:partenaire/utils/upload-file.dart';

class AddLogementBloc with ChangeNotifier {
  int menuAdd = 0;

  MapService mapService = MapService();

  BienService bienService = BienService();

  AuthService authService = AuthService();

  LogementService logementService = LogementService();

  AdminUserModel? auth;

  String paysAuth = "gn";

  getAuthPays() async {
    paysAuth = await logementService.getPays();
    notifyListeners();
  }

  getUser() async {
    auth = await authService.getAuth();
    premierePorucentage.text = auth!.conditionAnulation!.first.pourcantage!;
    premiereJour.text = auth!.conditionAnulation!.first.jour!;
    deuxiemePorucentage.text = auth!.conditionAnulation![1].pourcantage!;
    deuxiemeJour.text = auth!.conditionAnulation![1].jour!;
    troisiemePorucentage.text = auth!.conditionAnulation![2].pourcantage!;
    troisiemeJour.text = auth!.conditionAnulation![2].jour!;
    notifyListeners();
  }

  TextEditingController titreChambre = TextEditingController();
  TextEditingController nbreChambre = TextEditingController();
  TextEditingController nbreVoyageur = TextEditingController();
  TextEditingController nbreLit = TextEditingController();
  TextEditingController nbreSalleBain = TextEditingController();

  TextEditingController nbreMinJour = TextEditingController();
  TextEditingController tarif_nuit = TextEditingController();
  TextEditingController tarif_locataire = TextEditingController();
  TextEditingController tarif_femme_menagere = TextEditingController();

  TextEditingController premierePorucentage = TextEditingController();
  TextEditingController premiereJour = TextEditingController();
  TextEditingController deuxiemePorucentage = TextEditingController();
  TextEditingController deuxiemeJour = TextEditingController();
  TextEditingController troisiemePorucentage = TextEditingController();
  TextEditingController troisiemeJour = TextEditingController();

  AddLogementBloc() {
    getUser();
    tarif_locataire.text = "0";
    tarif_femme_menagere.text = "0";

    nbreChambre.text = "1";

    nbreVoyageur.text = "4";
    nbreLit.text = "1";
    nbreSalleBain.text = "1";
    descriptionLogement.text =
        "Appartement moderne, Conakry. Sécurité 24/7, vue panoramique sur l'océan Atlantique, à quelques pas des plages immaculées. Proche des restaurants et des marchés locaux. L'endroit parfait pour les touristes en quête de confort, de culture et de beauté à Conakry.";
    notifyListeners();
  }

  bool firstClickDescription = false;

  setFirstClickDescription() {
    firstClickDescription = true;
    descriptionLogement.text = "";
    notifyListeners();
  }

  List<dynamic> photoCouverture = [null, null];
  bool chargementPhotoCouverture = false;

  getPhotoCouverture() async {
    chargementPhotoCouverture = true;
    notifyListeners();
    photoCouverture = await getImage(1);
    chargementPhotoCouverture = false;
    notifyListeners();
  }

  removePhotoCouverture() async {
    chargementPhotoCouverture = false;
    photoCouverture = [null, null];
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

  List<dynamic> photo3 = [null, null];
  bool chargementPhoto3 = false;

  getPhoto3() async {
    chargementPhoto3 = true;
    notifyListeners();
    photo3 = await getImage(1);
    chargementPhoto3 = false;
    notifyListeners();
  }

  removePhoto3() async {
    chargementPhoto3 = false;
    photo3 = [null, null];
    notifyListeners();
  }

  List<dynamic> photo4 = [null, null];
  bool chargementPhoto4 = false;

  getPhoto4() async {
    chargementPhoto4 = true;
    notifyListeners();
    photo4 = await getImage(1);
    chargementPhoto4 = false;
    notifyListeners();
  }

  removePhoto4() async {
    chargementPhoto4 = false;
    photo4 = [null, null];
    notifyListeners();
  }

  TextEditingController descriptionLogement = TextEditingController();

  List<Map<String, String>> listeTypeLogements = [
    {"url": "assets/images/hotels.png", "titre": 'Hôtels'},
    {"url": "assets/images/villa.png", "titre": 'Villa'},
    {"url": "assets/images/appartements.png", "titre": 'Appartements'},
    {"url": "assets/images/chambre.png", "titre": 'Chambres'},
  ];

  List<Map<String, String>> listeTypeLogementsHotels = [
    {"url": "assets/images/chambre.png", "titre": 'Chambres standard'},
    {"url": "assets/images/standard.png", "titre": 'Chambres deluxe'},
    {"url": "assets/images/suites.png", "titre": 'Suites'},
  ];

  Map<String, String>? seletectedType;
  Map<String, String>? seletectedTypeHotel;

  List<Map<String, String>> chambreCommodites = [
    {
      "url": "assets/images/lit-simple.jpg",
      "titre": 'Lit simple',
      'commodite': 'lit-simple'
    },
    {
      "url": "assets/images/double-lit.jpg",
      "titre": 'Double lit',
      'commodite': "lit-double"
    },
    {
      "url": "assets/images/lit-king.jpg",
      "titre": 'Lit king ',
      'commodite': "lit-king"
    },
    {
      "url": "assets/images/climatisateur.jpg",
      "titre": 'Climatiseur',
      'commodite': "climatiseur"
    },
    {"url": "assets/images/wifi.jpg", "titre": 'Wifi', 'commodite': "wifi"},
    {
      "url": "assets/images/armoire.jpg",
      "titre": 'Armoires',
      'commodite': "armoire"
    }
  ];

  List<Map<String, String>> selectedChambreCommodite = [];

  setSelectedChambreCommodite(Map<String, String> value) {
    if (selectedChambreCommodite.contains(value)) {
      selectedChambreCommodite.remove(value);
    } else {
      selectedChambreCommodite.add(value);
    }
    notifyListeners();
  }

  List<Map<String, String>> salonCommodites = [
    {
      "url": "assets/images/tv.jpg",
      "titre": 'Téléviseur',
      'commodite': "televiseur"
    },
    {
      "url": "assets/images/table-basse.jpg",
      "titre": 'Table basse',
      'commodite': "table-basse"
    },
    {
      "url": "assets/images/climatisateur.jpg",
      "titre": 'Climatiseur',
      'commodite': "climatiseur"
    },
    {
      "url": "assets/images/ventilateur.jpg",
      "titre": 'Ventillateur',
      'commodite': "ventilateur"
    },
    {
      "url": "assets/images/canape-moderne.jpg",
      "titre": 'Canapé',
      'commodite': "canape"
    },
    {
      "url": "assets/images/table-manger.jpg",
      "titre": 'Table à manger',
      'commodite': "table-a-manger"
    }
  ];

  List<Map<String, String>> selectedSalonCommodite = [];

  setSelectedSalonCommodite(Map<String, String> value) {
    if (selectedSalonCommodite.contains(value)) {
      selectedSalonCommodite.remove(value);
    } else {
      selectedSalonCommodite.add(value);
    }
    notifyListeners();
  }

  List<Map<String, String>> cuisineCommodites = [
    {
      "url": "assets/images/refrigerateur.jpg",
      "titre": 'Réfrigérateur',
      'commodite': "refrigerateur"
    },
    {
      "url": "assets/images/micro-onde.jpg",
      "titre": 'Micro-onde',
      'commodite': "micro-onde"
    },
    {
      "url": "assets/images/cuisiniere.jpg",
      "titre": 'Cuisinière',
      'commodite': "cuisiniere"
    },
    {
      "url": "assets/images/Mixeur.jpg",
      "titre": 'Mixeur',
      'commodite': "mixeur"
    },
    {
      "url": "assets/images/cafetiere.jpg",
      "titre": 'Cafetière',
      'commodite': "cafetiere"
    },
    {
      "url": "assets/images/bouilloire-electrique.jpg",
      "titre": 'Bouilloire',
      'commodite': "bouilloire"
    },
    {
      "url": "assets/images/couvert.jpg",
      "titre": 'Couverts',
      'commodite': "couverts"
    }
  ];

  List<Map<String, String>> selectedCuisineCommodite = [];

  setSelectedCuisineCommodite(Map<String, String> value) {
    if (selectedCuisineCommodite.contains(value)) {
      selectedCuisineCommodite.remove(value);
    } else {
      selectedCuisineCommodite.add(value);
    }
    notifyListeners();
  }

  List<Map<String, String>> salleDeBainCommodites = [
    {
      "url": "assets/images/baignoire.jpg",
      "titre": 'Baignoire',
      'commodite': "baignoire"
    },
    {
      "url": "assets/images/mur-douche.jpg",
      "titre": 'Douche',
      'commodite': "douche"
    },
    {
      "url": "assets/images/seche-cheveux.jpg",
      "titre": 'Sèche cheveux',
      'commodite': "seche-cheveux"
    },
    {
      "url": "assets/images/miroir.jpg",
      "titre": 'Miroir',
      'commodite': "miroir"
    }
  ];

  List<Map<String, String>> selectedSalleDeBainCommodite = [];

  setSelectedSalleDeBainCommodite(Map<String, String> value) {
    if (selectedSalleDeBainCommodite.contains(value)) {
      selectedSalleDeBainCommodite.remove(value);
    } else {
      selectedSalleDeBainCommodite.add(value);
    }
    notifyListeners();
  }

  List<Map<String, String>> buanderieCommodites = [
    {
      "url": "assets/images/machine-laver.jpg",
      "titre": 'Lave Linge',
      'commodite': "machine-laver"
    },
    {
      "url": "assets/images/corde-linge-vetements.jpg",
      "titre": 'Sèche Linge',
      'commodite': "seche-linge"
    },
    {
      "url": "assets/images/fer.jpg",
      "titre": 'Fer à repasser',
      'commodite': "fer-repasser"
    },
    {
      "url": "assets/images/chaudiere-electrique.jpg",
      "titre": 'Chaudière',
      'commodite': "chaudiere"
    }
  ];

  List<Map<String, String>> selectedBuanderieCommodite = [];

  setSelectedBuanderieCommodite(Map<String, String> value) {
    if (selectedBuanderieCommodite.contains(value)) {
      selectedBuanderieCommodite.remove(value);
    } else {
      selectedBuanderieCommodite.add(value);
    }
    notifyListeners();
  }

  List<Map<String, String>> jardinCommodites = [
    {
      "url": "assets/images/piscine-prive.jpg",
      "titre": 'Piscine privé',
      'commodite': "piscine-prive"
    },
    {
      "url": "assets/images/piscine-public.jpg",
      "titre": 'Piscine commune',
      'commodite': "piscine-public"
    },
    {
      "url": "assets/images/jardin-prive.jpg",
      "titre": 'Jardin Privé',
      'commodite': "jardin-prive"
    },
    {
      "url": "assets/images/jardin-public.jpg",
      "titre": 'Jardin commun',
      'commodite': "jardin-public"
    }
  ];

  List<Map<String, String>> selectedJardinCommodite = [];

  setSelectedJardinCommodite(Map<String, String> value) {
    if (selectedJardinCommodite.contains(value)) {
      selectedJardinCommodite.remove(value);
    } else {
      selectedJardinCommodite.add(value);
    }
    notifyListeners();
  }

  List<Map<String, String>> serviceAnnexeCommodites = [
    {
      "url": "assets/images/parking.jpg",
      "titre": 'Parking Gratuit',
      'commodite': "parking"
    },
    {
      "url": "assets/images/gardien.jpg",
      "titre": 'Gardien',
      'commodite': "gardien"
    },
    {
      "url": "assets/images/menage-femme.jpg",
      "titre": 'ménagere',
      'commodite': "menagere"
    },
    {
      "url": "assets/images/alarme-incendie.jpg",
      "titre": 'Alarme incendie',
      'commodite': "alarme-incendie"
    },
    {
      "url": "assets/images/extincteurs.jpg",
      "titre": 'Extincteur',
      'commodite': "extincteur"
    },
    {
      "url": "assets/images/eau-forage.jpg",
      "titre": 'Eau de forage',
      'commodite': "eau-forage"
    },
  ];

  List<Map<String, String>> selectedServiceAnnexeCommodite = [];

  setSelectedServiceAnnexeCommodite(Map<String, String> value) {
    if (selectedServiceAnnexeCommodite.contains(value)) {
      selectedServiceAnnexeCommodite.remove(value);
    } else {
      selectedServiceAnnexeCommodite.add(value);
    }
    notifyListeners();
  }

  TextEditingController adresse = TextEditingController();
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
        await mapService.adresseAutoComplet(adresse.text, paysAuth);
    notifyListeners();
  }

  setSelectedType(Map<String, String> select) {
    seletectedType = select;
    notifyListeners();
  }

  setSelectedTypeHotel(Map<String, String> select) {
    seletectedTypeHotel = select;
    notifyListeners();
  }

  changeMenuAdd(int value) {
    menuAdd = value;
    if (value == 4) {
      commoditeGerenal = [
        {
          "url": "assets/images/chambre.png",
          "titre": "Chambres",
          "sub": selectedChambreCommodite
        },
        {
          "url": "assets/images/tv.png",
          "titre": "Salon",
          "sub": selectedSalonCommodite
        },
        {
          "url": "assets/images/cuisine.png",
          "titre": "Cuisine",
          "sub": selectedCuisineCommodite
        },
        {
          "url": "assets/images/bath.png",
          "titre": "Salle de Bain",
          "sub": selectedSalleDeBainCommodite
        },
        {
          "url": "assets/images/faire-secher.png",
          "titre": "Buenderie",
          "sub": selectedBuanderieCommodite
        },
        {
          "url": "assets/images/mobilier-exterieur.png",
          "titre": "Jardin",
          "sub": selectedJardinCommodite
        },
        {
          "url": "assets/images/not-inclue.png",
          "titre": "Service annexes",
          "sub": selectedServiceAnnexeCommodite
        },
      ];
    }
    notifyListeners();
  }

  List<Map<String, dynamic>> commoditeGerenal = [];

  Map<String, dynamic>? selectedCommoditeGeneral;

  setSelectedCommoditeGeneral(Map<String, dynamic>? select) {
    if (selectedCommoditeGeneral == select) {
      selectedCommoditeGeneral = null;
    } else {
      selectedCommoditeGeneral = select;
    }
    notifyListeners();
  }

  bool chargementAddFun = false;

  BiensModels? biensAdd;

  addLogementFun() async {
    chargementAddFun = true;
    notifyListeners();
    Map<String, dynamic> body = {
      "adresse": adresse.text,
      "typeLogement": seletectedType!['titre'] == "Hôtels"
          ? seletectedTypeHotel!['titre']
          : seletectedType!['titre'],
      "titre": titreChambre.text,
      "description": descriptionLogement.text,
      "nbreChambre": int.parse(nbreChambre.text),
      "nbreVoyageur": int.parse(nbreVoyageur.text),
      "nbreLit": int.parse(nbreLit.text),
      "nbreSalleBain": int.parse(nbreSalleBain.text),
      "galery": [
        photoCouverture.first,
        photo1.first,
        photo2.first,
        photo3.first,
        photo4.first
      ],
      "conditionAnulation": [
        {"pourcantage": premierePorucentage.text, "jour": premiereJour.text},
        {"pourcantage": deuxiemePorucentage.text, "jour": deuxiemeJour.text},
        {"pourcantage": troisiemePorucentage.text, "jour": troisiemeJour.text},
      ],
      "commoditeChambre":
          selectedChambreCommodite.map((e) => e['commodite']).toList(),
      "commoditeSalon":
          selectedSalonCommodite.map((e) => e['commodite']).toList(),
      "commoditeCuisine":
          selectedCuisineCommodite.map((e) => e['commodite']).toList(),
      "commoditeSalleBain":
          selectedSalleDeBainCommodite.map((e) => e['commodite']).toList(),
      "commoditeBuanderie":
          selectedBuanderieCommodite.map((e) => e['commodite']).toList(),
      "commoditeJardin":
          selectedJardinCommodite.map((e) => e['commodite']).toList(),
      "commoditeServiceAnnexe":
          selectedServiceAnnexeCommodite.map((e) => e['commodite']).toList(),
      "nbreMinNuit": int.parse(nbreMinJour.text),
      "tarif": int.parse(tarif_nuit.text),
      "tarifLocataireSupplementaire": int.parse(tarif_locataire.text),
      "tarif_menagere": int.parse(tarif_femme_menagere.text)
    };

    biensAdd = await bienService.add(body);

    if (biensAdd != null) {
      Fluttertoast.showToast(
          msg: "Bien ajouté avec réussite",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webPosition: "center",
          webBgColor: "linear-gradient(to right, #2E8C1F, #2E8C1F)",
          fontSize: 14.0);

      resetData();
    } else {
      Fluttertoast.showToast(
          msg: "Une erreur a été saisie",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webPosition: "center",
          webBgColor: "linear-gradient(to right, #9D0208, #9D0208)",
          fontSize: 14.0);
    }
    chargementAddFun = false;
    notifyListeners();
  }

  resetData() {
    menuAdd = 0;
    adresse.text = "";
    seletectedType = null;
    seletectedTypeHotel = null;
    titreChambre.text = "";
    nbreChambre.text = "1";
    nbreVoyageur.text = "4";
    nbreLit.text = "1";
    nbreSalleBain.text = "1";
    photoCouverture = [null, null];
    photo1 = [null, null];
    photo2 = [null, null];
    photo3 = [null, null];
    photo4 = [null, null];
    selectedChambreCommodite = [];
    selectedSalonCommodite = [];
    selectedCuisineCommodite = [];
    selectedSalleDeBainCommodite = [];
    selectedBuanderieCommodite = [];
    selectedJardinCommodite = [];
    selectedServiceAnnexeCommodite = [];
    nbreMinJour.text = "";
    tarif_nuit.text = "";
    tarif_locataire.text = "";
    tarif_femme_menagere.text = "";
    notifyListeners();
  }
}
