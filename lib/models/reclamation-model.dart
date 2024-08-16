class ReclamationModel {
  String? typeService;
  String? type;
  Obect? obect;
  String? probleme;
  String? solution;
  String? statusReclamation;
  String? ticketReclamation;
  String? id;
  String? niveauReclamations;

  ReclamationModel(
      {this.typeService,
      this.type,
      this.obect,
      this.probleme,
      this.solution,
      this.statusReclamation,
      this.ticketReclamation,
      this.niveauReclamations,
      this.id});

  ReclamationModel.fromJson(Map<String, dynamic> json) {
    typeService = json['typeService'];
    type = json['type'];
    obect = json['obect'] != null ? new Obect.fromJson(json['obect']) : null;
    probleme = json['probleme'];
    solution = json['solution'];
    statusReclamation = json['statusReclamation'];
    ticketReclamation = json['ticketReclamation'];
    niveauReclamations = json['niveauReclamations'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typeService'] = this.typeService;
    data['type'] = this.type;
    if (this.obect != null) {
      data['obect'] = this.obect!.toJson();
    }
    data['probleme'] = this.probleme;
    data['solution'] = this.solution;
    data['statusReclamation'] = this.statusReclamation;
    data['ticketReclamation'] = this.ticketReclamation;
    data['niveauReclamations'] = this.niveauReclamations;
    data['id'] = this.id;
    return data;
  }

  static List<ReclamationModel> fromList({required data}) {
    List<ReclamationModel> liste = [];

    for (var element in data) {
      liste.add(ReclamationModel.fromJson(element));
    }

    return liste;
  }
}

class Obect {
  Transaction? transaction;
  Commande? commande;
  PointDepart? pointDepart;
  PointDepart? pointArrive;
  Distance? distance;
  Distance? duree;
  String? addresseDepart;
  String? addresseArrive;
  String? statusLivraison;
  String? statusLivraisonVehicule;
  String? statusCourses;
  List<String>? courseCancelRaison;
  String? statusDate;
  String? dateCourses;
  Client? client;
  int? prixTotal;
  int? prixOffre;
  String? id;

  Obect(
      {this.transaction,
      this.commande,
      this.pointDepart,
      this.pointArrive,
      this.distance,
      this.duree,
      this.addresseDepart,
      this.addresseArrive,
      this.statusLivraison,
      this.statusLivraisonVehicule,
      this.statusCourses,
      this.courseCancelRaison,
      this.statusDate,
      this.dateCourses,
      this.client,
      this.prixTotal,
      this.prixOffre,
      this.id});

  Obect.fromJson(Map<String, dynamic> json) {
    transaction = json['transaction'] != null
        ? new Transaction.fromJson(json['transaction'])
        : null;
    commande = json['commande'] != null
        ? new Commande.fromJson(json['commande'])
        : null;
    pointDepart = json['pointDepart'] != null
        ? new PointDepart.fromJson(json['pointDepart'])
        : null;
    pointArrive = json['pointArrive'] != null
        ? new PointDepart.fromJson(json['pointArrive'])
        : null;
    distance = json['distance'] != null
        ? new Distance.fromJson(json['distance'])
        : null;
    duree = json['duree'] != null ? new Distance.fromJson(json['duree']) : null;
    addresseDepart = json['addresseDepart'];
    addresseArrive = json['addresseArrive'];
    statusLivraison = json['statusLivraison'];
    statusLivraisonVehicule = json['statusLivraisonVehicule'];
    statusCourses = json['statusCourses'];
    courseCancelRaison = json['courseCancelRaison'].cast<String>();

    statusDate = json['statusDate'];
    dateCourses = json['dateCourses'];
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
    prixTotal = json['prix_total'];
    prixOffre = json['prix_offre'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transaction != null) {
      data['transaction'] = this.transaction!.toJson();
    }
    if (this.commande != null) {
      data['commande'] = this.commande!.toJson();
    }
    if (this.pointDepart != null) {
      data['pointDepart'] = this.pointDepart!.toJson();
    }
    if (this.pointArrive != null) {
      data['pointArrive'] = this.pointArrive!.toJson();
    }
    if (this.distance != null) {
      data['distance'] = this.distance!.toJson();
    }
    if (this.duree != null) {
      data['duree'] = this.duree!.toJson();
    }
    data['addresseDepart'] = this.addresseDepart;
    data['addresseArrive'] = this.addresseArrive;
    data['statusLivraison'] = this.statusLivraison;
    data['statusLivraisonVehicule'] = this.statusLivraisonVehicule;
    data['statusCourses'] = this.statusCourses;
    data['courseCancelRaison'] = this.courseCancelRaison;

    data['statusDate'] = this.statusDate;
    data['dateCourses'] = this.dateCourses;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    data['prix_total'] = this.prixTotal;
    data['prix_offre'] = this.prixOffre;
    data['id'] = this.id;
    return data;
  }
}

class Transaction {
  String? status;
  String? typeService;
  String? means;
  String? dateTransactionSuccess;
  String? amount;
  String? userWallet;
  String? reference;
  String? id;

  Transaction(
      {this.status,
      this.typeService,
      this.means,
      this.dateTransactionSuccess,
      this.amount,
      this.userWallet,
      this.reference,
      this.id});

  Transaction.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    typeService = json['typeService'];
    means = json['means'];
    dateTransactionSuccess = json['dateTransactionSuccess'];
    amount = json['amount'];
    userWallet = json['userWallet'];
    reference = json['reference'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['typeService'] = this.typeService;
    data['means'] = this.means;
    data['dateTransactionSuccess'] = this.dateTransactionSuccess;
    data['amount'] = this.amount;
    data['userWallet'] = this.userWallet;
    data['reference'] = this.reference;
    data['id'] = this.id;
    return data;
  }
}

class Commande {
  List<Panniers>? panniers;
  PointDepart? pointDepart;
  PointDepart? pointArrive;
  String? addresseLivraion;
  String? addresseRestaurant;
  String? statusLivraison;
  String? creneaux;
  String? status;
  String? etatLivraison;
  String? contriePaiement;
  String? table;
  String? means;
  String? dateTransactionSuccess;
  String? reference;
  Restaurant? restaurant;
  String? client;
  int? prixTotal;
  int? prixOffre;
  int? prixLivraison;
  String? phonePaiement;
  String? id;

  Commande(
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
      this.table,
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

  Commande.fromJson(Map<String, dynamic> json) {
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
    addresseLivraion = json['addresseLivraion'];
    addresseRestaurant = json['addresseRestaurant'];
    statusLivraison = json['statusLivraison'];
    creneaux = json['creneaux'];
    status = json['status'];
    etatLivraison = json['etatLivraison'];
    contriePaiement = json['contriePaiement'];
    table = json['table'];
    means = json['means'];
    dateTransactionSuccess = json['dateTransactionSuccess'];
    reference = json['reference'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
    client = json['client'];
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
    data['addresseLivraion'] = this.addresseLivraion;
    data['addresseRestaurant'] = this.addresseRestaurant;
    data['statusLivraison'] = this.statusLivraison;
    data['creneaux'] = this.creneaux;
    data['status'] = this.status;
    data['etatLivraison'] = this.etatLivraison;
    data['contriePaiement'] = this.contriePaiement;
    data['table'] = this.table;
    data['means'] = this.means;
    data['dateTransactionSuccess'] = this.dateTransactionSuccess;
    data['reference'] = this.reference;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant!.toJson();
    }
    data['client'] = this.client;
    data['prix_total'] = this.prixTotal;
    data['prix_offre'] = this.prixOffre;
    data['prix_livraison'] = this.prixLivraison;
    data['phonePaiement'] = this.phonePaiement;
    data['id'] = this.id;
    return data;
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

class Plat {
  bool? isFreeLivraison;
  List<Galery>? galery;
  String? specialite;
  List<String>? menu;
  String? pays;
  List<Complements>? complements;

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
  String? adresse;
  String? nomEntreprise;
  String? telephone;
  String? id;

  Restaurant({this.adresse, this.nomEntreprise, this.telephone, this.id});

  Restaurant.fromJson(Map<String, dynamic> json) {
    adresse = json['adresse'];
    nomEntreprise = json['nomEntreprise'];
    telephone = json['telephone'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adresse'] = this.adresse;
    data['nomEntreprise'] = this.nomEntreprise;
    data['telephone'] = this.telephone;
    data['id'] = this.id;
    return data;
  }
}

class Distance {
  String? text;
  int? value;

  Distance({this.text, this.value});

  Distance.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['value'] = this.value;
    return data;
  }
}

class Client {
  String? nom;
  String? prenom;
  String? telephone;
  String? id;

  Client({this.nom, this.prenom, this.telephone, this.id});

  Client.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    prenom = json['prenom'];
    telephone = json['telephone'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['telephone'] = this.telephone;
    data['id'] = this.id;
    return data;
  }
}
