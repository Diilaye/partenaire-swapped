class CommandeRestaurantModel {
  List<Panniers>? panniers;
  PointDepart? pointDepart;
  String? addresseLivraion;
  String? addresseRestaurant;
  PointDepart? pointArrive;
  String? statusLivraison;
  String? creneaux;
  String? status;
  String? etatLivraison;
  String? contriePaiement;
  String? means;
  String? dateTransactionSuccess;
  String? reference;
  Restaurant? restaurant;
  Client? client;
  int? prixTotal;
  int? prixOffre;
  int? prixLivraison;
  String? phonePaiement;
  String? id;

  CommandeRestaurantModel(
      {this.panniers,
      this.pointDepart,
      this.pointArrive,
      this.addresseLivraion,
      this.addresseRestaurant,
      this.statusLivraison,
      this.creneaux,
      this.status,
      this.etatLivraison,
      this.contriePaiement,
      this.means,
      this.dateTransactionSuccess,
      this.reference,
      this.restaurant,
      this.client,
      this.prixTotal,
      this.prixOffre,
      this.prixLivraison,
      this.phonePaiement,
      this.id});

  CommandeRestaurantModel.fromJson(Map<String, dynamic> json) {
    if (json['panniers'] != null) {
      panniers = <Panniers>[];
      json['panniers'].forEach((v) {
        panniers!.add(new Panniers.fromJson(v));
      });
    }
    pointDepart = json['pointDepart'] != null
        ? new PointDepart.fromJson(json['pointDepart'])
        : null;
    pointArrive = json['pointArrive'] != null
        ? new PointDepart.fromJson(json['pointArrive'])
        : null;
    statusLivraison = json['statusLivraison'];
    addresseLivraion = json['addresseLivraion'];
    addresseRestaurant = json['addresseRestaurant'];
    creneaux = json['creneaux'];
    status = json['status'];
    etatLivraison = json['etatLivraison'];
    contriePaiement = json['contriePaiement'];
    means = json['means'];
    dateTransactionSuccess = json['dateTransactionSuccess'];
    reference = json['reference'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
    prixTotal = json['prix_total'];
    prixOffre = json['prix_offre'];
    prixLivraison = json['prix_livraison'];
    phonePaiement = json['phonePaiement'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.panniers != null) {
      data['panniers'] = this.panniers!.map((v) => v.toJson()).toList();
    }
    if (this.pointDepart != null) {
      data['pointDepart'] = this.pointDepart!.toJson();
    }
    if (this.pointArrive != null) {
      data['pointArrive'] = this.pointArrive!.toJson();
    }
    data['statusLivraison'] = this.statusLivraison;
    data['addresseLivraion'] = this.addresseLivraion;
    data['addresseRestaurant'] = this.addresseRestaurant;
    data['etatLivraison'] = this.etatLivraison;
    data['creneaux'] = this.creneaux;
    data['status'] = this.status;
    data['contriePaiement'] = this.contriePaiement;
    data['means'] = this.means;
    data['dateTransactionSuccess'] = this.dateTransactionSuccess;
    data['reference'] = this.reference;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant!.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    data['prix_total'] = this.prixTotal;
    data['prix_offre'] = this.prixOffre;
    data['prix_livraison'] = this.prixLivraison;
    data['phonePaiement'] = this.phonePaiement;
    data['id'] = this.id;
    return data;
  }

  static List<CommandeRestaurantModel> fromList({required data}) {
    List<CommandeRestaurantModel> liste = [];

    for (var element in data) {
      liste.add(CommandeRestaurantModel.fromJson(element));
    }

    return liste;
  }
}

class Panniers {
  int? quantity;
  List<Complements>? complements;
  String? status;
  Plat? plat;
  String? restaurant;
  String? client;
  int? prixTotal;
  String? id;

  Panniers(
      {this.quantity,
      this.complements,
      this.status,
      this.plat,
      this.restaurant,
      this.client,
      this.prixTotal,
      this.id});

  Panniers.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    if (json['complements'] != null) {
      complements = <Complements>[];
      json['complements'].forEach((v) {
        complements!.add(new Complements.fromJson(v));
      });
    }
    status = json['status'];
    plat = json['plat'] != null ? new Plat.fromJson(json['plat']) : null;
    restaurant = json['restaurant'];
    client = json['client'];
    prixTotal = json['prix_total'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    if (this.complements != null) {
      data['complements'] = this.complements!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    if (this.plat != null) {
      data['plat'] = this.plat!.toJson();
    }
    data['restaurant'] = this.restaurant;
    data['client'] = this.client;
    data['prix_total'] = this.prixTotal;
    data['id'] = this.id;
    return data;
  }
}

class Complements {
  String? name;
  int? prix;

  Complements({this.name, this.prix});

  Complements.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    prix = json['prix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['prix'] = this.prix;
    return data;
  }
}

class Plat {
  bool? isFreeLivraison;
  List<Galery>? galery;
  String? specialite;
  List<String>? menu;
  String? pays;
  List<Complements>? complements;
  List<Null>? commandes;
  List<Null>? notes;
  List<Null>? commentaires;
  bool? isDisponible;
  bool? isLivrable;
  String? titre;
  String? description;
  int? tarif;
  String? idRestaurant;
  String? id;

  Plat(
      {this.isFreeLivraison,
      this.galery,
      this.specialite,
      this.menu,
      this.pays,
      this.complements,
      this.commandes,
      this.notes,
      this.commentaires,
      this.isDisponible,
      this.isLivrable,
      this.titre,
      this.description,
      this.tarif,
      this.idRestaurant,
      this.id});

  Plat.fromJson(Map<String, dynamic> json) {
    isFreeLivraison = json['isFreeLivraison'];
    if (json['galery'] != null) {
      galery = <Galery>[];
      json['galery'].forEach((v) {
        galery!.add(new Galery.fromJson(v));
      });
    }
    specialite = json['specialite'];
    menu = json['menu'].cast<String>();
    pays = json['pays'];
    if (json['complements'] != null) {
      complements = <Complements>[];
      json['complements'].forEach((v) {
        complements!.add(new Complements.fromJson(v));
      });
    }

    isDisponible = json['isDisponible'];
    isLivrable = json['isLivrable'];
    titre = json['titre'];
    description = json['description'];
    tarif = json['tarif'];
    idRestaurant = json['idRestaurant'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFreeLivraison'] = this.isFreeLivraison;
    if (this.galery != null) {
      data['galery'] = this.galery!.map((v) => v.toJson()).toList();
    }
    data['specialite'] = this.specialite;
    data['menu'] = this.menu;
    data['pays'] = this.pays;
    if (this.complements != null) {
      data['complements'] = this.complements!.map((v) => v.toJson()).toList();
    }

    data['isDisponible'] = this.isDisponible;
    data['isLivrable'] = this.isLivrable;
    data['titre'] = this.titre;
    data['description'] = this.description;
    data['tarif'] = this.tarif;
    data['idRestaurant'] = this.idRestaurant;
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

class PointDepart {
  double? lat;
  double? lng;

  PointDepart({this.lat, this.lng});

  PointDepart.fromJson(Map<String, dynamic> json) {
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

class Restaurant {
  String? nomEntreprise;
  String? descriptionEntreprise;
  String? telephone;
  String? email;
  List<Galery>? gallerie;
  List<Null>? notes;
  List<Null>? commentaires;
  List<String>? plats;
  List<String>? specialMenu;
  List<String>? commodite;
  String? status;
  String? service;
  String? idParent;
  Galery? photoCover;
  String? adresse;
  String? heureFermeture;
  String? heureOuverture;
  List<String>? jourOuvertures;
  String? nombreTable;
  List<String>? specialite;
  String? telephone1;
  String? telephone2;
  String? pays;
  PointDepart? localisation;
  String? id;

  Restaurant(
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

  Restaurant.fromJson(Map<String, dynamic> json) {
    nomEntreprise = json['nomEntreprise'];
    descriptionEntreprise = json['descriptionEntreprise'];
    telephone = json['telephone'];
    email = json['email'];
    if (json['gallerie'] != null) {
      gallerie = <Galery>[];
      json['gallerie'].forEach((v) {
        gallerie!.add(new Galery.fromJson(v));
      });
    }

    plats = json['plats'].cast<String>();
    specialMenu = json['specialMenu'].cast<String>();
    commodite = json['commodite'].cast<String>();
    status = json['status'];
    service = json['service'];
    idParent = json['idParent'];
    photoCover = json['photoCover'] != null
        ? new Galery.fromJson(json['photoCover'])
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
        ? new PointDepart.fromJson(json['localisation'])
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
    data['plats'] = this.plats;
    data['specialMenu'] = this.specialMenu;
    data['commodite'] = this.commodite;
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
