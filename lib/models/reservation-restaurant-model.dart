class ReservationRestaurantModel {
  int? nombrePersonne;
  String? creneaux;
  String? statusRes;
  String? date;
  Restaurants? restaurants;
  Client? client;
  String? id;

  ReservationRestaurantModel(
      {this.nombrePersonne,
      this.creneaux,
      this.statusRes,
      this.date,
      this.restaurants,
      this.client,
      this.id});

  ReservationRestaurantModel.fromJson(Map<String, dynamic> json) {
    nombrePersonne = json['nombrePersonne'];
    creneaux = json['creneaux'];
    statusRes = json['statusRes'];
    date = json['date'];
    restaurants = json['restaurants'] != null
        ? new Restaurants.fromJson(json['restaurants'])
        : null;
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombrePersonne'] = this.nombrePersonne;
    data['creneaux'] = this.creneaux;
    data['statusRes'] = this.statusRes;
    data['date'] = this.date;
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants!.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    data['id'] = this.id;
    return data;
  }

  static List<ReservationRestaurantModel> fromList({required data}) {
    List<ReservationRestaurantModel> liste = [];
    for (var element in data) {
      liste.add(ReservationRestaurantModel.fromJson(element));
    }
    return liste;
  }
}

class Restaurants {
  String? nomEntreprise;
  String? descriptionEntreprise;
  String? telephone;
  String? email;
  List<Gallerie>? gallerie;
  List<Null>? notes;
  List<Null>? commentaires;
  List<String>? plats;
  List<String>? specialMenu;
  List<Null>? commodite;
  String? status;
  String? service;
  String? idParent;
  Gallerie? photoCover;
  String? adresse;
  String? heureFermeture;
  String? heureOuverture;
  List<String>? jourOuvertures;
  String? nombreTable;
  List<String>? specialite;
  String? telephone1;
  String? telephone2;
  String? pays;
  Localisation? localisation;
  String? id;

  Restaurants(
      {this.nomEntreprise,
      this.descriptionEntreprise,
      this.telephone,
      this.email,
      this.gallerie,
      this.notes,
      this.commentaires,
      this.plats,
      this.specialMenu,
      this.commodite,
      this.status,
      this.service,
      this.idParent,
      this.photoCover,
      this.adresse,
      this.heureFermeture,
      this.heureOuverture,
      this.jourOuvertures,
      this.nombreTable,
      this.specialite,
      this.telephone1,
      this.telephone2,
      this.pays,
      this.localisation,
      this.id});

  Restaurants.fromJson(Map<String, dynamic> json) {
    nomEntreprise = json['nomEntreprise'];
    descriptionEntreprise = json['descriptionEntreprise'];
    telephone = json['telephone'];
    email = json['email'];
    if (json['gallerie'] != null) {
      gallerie = <Gallerie>[];
      json['gallerie'].forEach((v) {
        gallerie!.add(new Gallerie.fromJson(v));
      });
    }
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
    plats = json['plats'].cast<String>();
    specialMenu = json['specialMenu'].cast<String>();
    // if (json['commodite'] != null) {
    //   commodite = <Null>[];
    //   json['commodite'].forEach((v) {
    //     commodite!.add(new Null.fromJson(v));
    //   });
    // }
    status = json['status'];
    service = json['service'];
    idParent = json['idParent'];
    photoCover = json['photoCover'] != null
        ? new Gallerie.fromJson(json['photoCover'])
        : null;
    adresse = json['adresse'];
    heureFermeture = json['heureFermeture'];
    heureOuverture = json['heureOuverture'];
    jourOuvertures = json['jourOuvertures'].cast<String>();
    nombreTable = json['nombreTable'];
    specialite = json['specialite'].cast<String>();
    telephone1 = json['telephone1'];
    telephone2 = json['telephone2'];
    pays = json['pays'];
    localisation = json['localisation'] != null
        ? new Localisation.fromJson(json['localisation'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomEntreprise'] = this.nomEntreprise;
    data['descriptionEntreprise'] = this.descriptionEntreprise;
    data['telephone'] = this.telephone;
    data['email'] = this.email;
    if (this.gallerie != null) {
      data['gallerie'] = this.gallerie!.map((v) => v.toJson()).toList();
    }
    // if (this.notes != null) {
    //   data['notes'] = this.notes!.map((v) => v.toJson()).toList();
    // }
    // if (this.commentaires != null) {
    //   data['commentaires'] = this.commentaires!.map((v) => v.toJson()).toList();
    // }
    data['plats'] = this.plats;
    data['specialMenu'] = this.specialMenu;
    // if (this.commodite != null) {
    //   data['commodite'] = this.commodite!.map((v) => v.toJson()).toList();
    // }
    data['status'] = this.status;
    data['service'] = this.service;
    data['idParent'] = this.idParent;
    if (this.photoCover != null) {
      data['photoCover'] = this.photoCover!.toJson();
    }
    data['adresse'] = this.adresse;
    data['heureFermeture'] = this.heureFermeture;
    data['heureOuverture'] = this.heureOuverture;
    data['jourOuvertures'] = this.jourOuvertures;
    data['nombreTable'] = this.nombreTable;
    data['specialite'] = this.specialite;
    data['telephone1'] = this.telephone1;
    data['telephone2'] = this.telephone2;
    data['pays'] = this.pays;
    if (this.localisation != null) {
      data['localisation'] = this.localisation!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Gallerie {
  String? date;
  String? url;
  String? type;
  String? id;

  Gallerie({this.date, this.url, this.type, this.id});

  Gallerie.fromJson(Map<String, dynamic> json) {
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

class Localisation {
  double? lat;
  double? lng;

  Localisation({this.lat, this.lng});

  Localisation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Client {
  String? nom;
  String? prenom;
  String? sexe;
  String? statusCompte;
  String? email;
  String? telephone;
  String? token;
  String? id;

  Client(
      {this.nom,
      this.prenom,
      this.sexe,
      this.statusCompte,
      this.email,
      this.telephone,
      this.token,
      this.id});

  Client.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    prenom = json['prenom'];
    sexe = json['sexe'];
    statusCompte = json['statusCompte'];
    email = json['email'];
    telephone = json['telephone'];
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['sexe'] = this.sexe;
    data['statusCompte'] = this.statusCompte;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['token'] = this.token;
    data['id'] = this.id;
    return data;
  }
}
