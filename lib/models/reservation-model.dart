class ReservationModel {
  String? status;
  bool? isDisponible;
  Bien? bien;
  User? user;
  Client? client;
  String? dateDebut;
  String? dateFin;
  String? id;

  ReservationModel(
      {this.status,
      this.isDisponible,
      this.bien,
      this.user,
      this.client,
      this.dateDebut,
      this.dateFin,
      this.id});

  ReservationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isDisponible = json['isDisponible'];
    bien = json['bien'] != null ? new Bien.fromJson(json['bien']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
    dateDebut = json['dateDebut'];
    dateFin = json['dateFin'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['isDisponible'] = this.isDisponible;
    if (this.bien != null) {
      data['bien'] = this.bien!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    data['dateDebut'] = this.dateDebut;
    data['dateFin'] = this.dateFin;
    data['id'] = this.id;
    return data;
  }

  static List<ReservationModel> fromList({required data}) {
    List<ReservationModel> liste = [];

    for (var element in data) {
      liste.add(ReservationModel.fromJson(element));
    }
    return liste;
  }
}

class Bien {
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
  String? id;

  Bien(
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
      this.id});

  Bien.fromJson(Map<String, dynamic> json) {
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
    data['id'] = this.id;
    return data;
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

class User {
  String? service;
  String? nom;
  String? prenom;
  String? telephone;
  String? email;
  String? date;
  String? identifiant;
  String? token;
  String? id;

  User(
      {this.service,
      this.nom,
      this.prenom,
      this.telephone,
      this.email,
      this.date,
      this.identifiant,
      this.token,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    service = json['service'];
    nom = json['nom'];
    prenom = json['prenom'];
    telephone = json['telephone'];
    email = json['email'];
    date = json['date'];
    identifiant = json['identifiant'];
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service'] = this.service;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['telephone'] = this.telephone;
    data['email'] = this.email;
    data['date'] = this.date;
    data['identifiant'] = this.identifiant;
    data['token'] = this.token;
    data['id'] = this.id;
    return data;
  }
}

class Client {
  String? nom;
  String? prenom;
  String? email;
  String? telephoneOM;
  String? token;
  String? id;

  Client(
      {this.nom,
      this.prenom,
      this.email,
      this.telephoneOM,
      this.token,
      this.id});

  Client.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    prenom = json['prenom'];
    email = json['email'];
    telephoneOM = json['telephoneOM'];
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['email'] = this.email;
    data['telephoneOM'] = this.telephoneOM;
    data['token'] = this.token;
    data['id'] = this.id;
    return data;
  }
}
