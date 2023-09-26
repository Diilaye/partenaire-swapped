class BiensModels {
  List<Galery>? galery;
  List<String>? commoditeChambre;
  List<String>? commoditeSalon;
  List<String>? commoditeCuisine;
  List<String>? commoditeSalleBain;
  List<String>? commoditeBuanderie;
  List<String>? commoditeJardin;
  List<String>? commoditeServiceAnnexe;
  List<Null>? reservations;
  List<Null>? notes;
  List<Null>? commentaires;
  bool? isDisponible;
  List<ConditionAnulation>? conditionAnulation;
  String? adresse;
  String? typeLogement;
  String? titre;
  String? description;
  int? nbreChambre;
  int? nbreVoyageur;
  int? nbreSalleBain;
  int? nbreMinNuit;
  int? tarif;
  int? tarifLocataireSupplementaire;
  int? tarifMenagere;
  String? idParent;
  int? nbreLit;
  String? id;

  BiensModels(
      {this.galery,
      this.commoditeChambre,
      this.commoditeSalon,
      this.commoditeCuisine,
      this.commoditeSalleBain,
      this.commoditeBuanderie,
      this.commoditeJardin,
      this.commoditeServiceAnnexe,
      this.reservations,
      this.notes,
      this.commentaires,
      this.isDisponible,
      this.conditionAnulation,
      this.adresse,
      this.typeLogement,
      this.titre,
      this.description,
      this.nbreChambre,
      this.nbreVoyageur,
      this.nbreSalleBain,
      this.nbreMinNuit,
      this.tarif,
      this.tarifLocataireSupplementaire,
      this.tarifMenagere,
      this.idParent,
      this.nbreLit,
      this.id});

  BiensModels.fromJson(Map<String, dynamic> json) {
    if (json['galery'] != null) {
      galery = <Galery>[];
      json['galery'].forEach((v) {
        galery!.add(new Galery.fromJson(v));
      });
    }
    commoditeChambre = json['commoditeChambre'].cast<String>();
    commoditeSalon = json['commoditeSalon'].cast<String>();
    commoditeCuisine = json['commoditeCuisine'].cast<String>();
    commoditeSalleBain = json['commoditeSalleBain'].cast<String>();
    commoditeBuanderie = json['commoditeBuanderie'].cast<String>();
    commoditeJardin = json['commoditeJardin'].cast<String>();
    commoditeServiceAnnexe = json['commoditeServiceAnnexe'].cast<String>();
    // if (json['reservations'] != null) {
    //   reservations = <Null>[];
    //   json['reservations'].forEach((v) {
    //     reservations!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['notes'] != null) {
    //   notes = <Null>[];
    //   json['notes'].forEach((v) {
    //     notes!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['commentaires'] != null) {
    //   commentaires = <Null>[];
    //   json['commentaires'].forEach((v) {
    //     commentaires!.add(new Null.fromJson(v));
    //   });
    // }
    isDisponible = json['isDisponible'];
    if (json['conditionAnulation'] != null) {
      conditionAnulation = <ConditionAnulation>[];
      json['conditionAnulation'].forEach((v) {
        conditionAnulation!.add(new ConditionAnulation.fromJson(v));
      });
    }
    adresse = json['adresse'];
    typeLogement = json['typeLogement'];
    titre = json['titre'];
    description = json['description'];
    nbreChambre = json['nbreChambre'];
    nbreVoyageur = json['nbreVoyageur'];
    nbreSalleBain = json['nbreSalleBain'];
    nbreMinNuit = json['nbreMinNuit'];
    tarif = json['tarif'];
    tarifLocataireSupplementaire = json['tarifLocataireSupplementaire'];
    tarifMenagere = json['tarif_menagere'];
    idParent = json['idParent'];
    nbreLit = json['nbreLit'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.galery != null) {
      data['galery'] = this.galery!.map((v) => v.toJson()).toList();
    }
    data['commoditeChambre'] = this.commoditeChambre;
    data['commoditeSalon'] = this.commoditeSalon;
    data['commoditeCuisine'] = this.commoditeCuisine;
    data['commoditeSalleBain'] = this.commoditeSalleBain;
    data['commoditeBuanderie'] = this.commoditeBuanderie;
    data['commoditeJardin'] = this.commoditeJardin;
    data['commoditeServiceAnnexe'] = this.commoditeServiceAnnexe;
    // if (this.reservations != null) {
    //   data['reservations'] = this.reservations!.map((v) => v.toJson()).toList();
    // }
    // if (this.notes != null) {
    //   data['notes'] = this.notes!.map((v) => v.toJson()).toList();
    // }
    // if (this.commentaires != null) {
    //   data['commentaires'] = this.commentaires!.map((v) => v.toJson()).toList();
    // }
    data['isDisponible'] = this.isDisponible;
    if (this.conditionAnulation != null) {
      data['conditionAnulation'] =
          this.conditionAnulation!.map((v) => v.toJson()).toList();
    }
    data['adresse'] = this.adresse;
    data['typeLogement'] = this.typeLogement;
    data['titre'] = this.titre;
    data['description'] = this.description;
    data['nbreChambre'] = this.nbreChambre;
    data['nbreVoyageur'] = this.nbreVoyageur;
    data['nbreSalleBain'] = this.nbreSalleBain;
    data['nbreMinNuit'] = this.nbreMinNuit;
    data['tarif'] = this.tarif;
    data['tarifLocataireSupplementaire'] = this.tarifLocataireSupplementaire;
    data['tarif_menagere'] = this.tarifMenagere;
    data['idParent'] = this.idParent;
    data['nbreLit'] = this.nbreLit;
    data['id'] = this.id;
    return data;
  }

  static List<BiensModels> fromList({required data}) {
    List<BiensModels> liste = [];

    for (var element in data) {
      liste.add(BiensModels.fromJson(element));
    }
    return liste;
  }
}

class Galery {
  String? date;
  String? url;
  String? type;
  String? id;

  Galery({this.date, this.url, this.type, this.id});

  Galery.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    url = json['url'];
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['url'] = this.url;
    data['type'] = this.type;
    data['id'] = this.id;
    return data;
  }
}

class ConditionAnulation {
  String? pourcantage;
  String? jour;

  ConditionAnulation({this.pourcantage, this.jour});

  ConditionAnulation.fromJson(Map<String, dynamic> json) {
    pourcantage = json['pourcantage'];
    jour = json['jour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pourcantage'] = this.pourcantage;
    data['jour'] = this.jour;
    return data;
  }
}
