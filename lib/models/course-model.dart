class CourseModel {
  Transaction? transaction;
  Mobilite? mobilite;
  String? commande;
  Localisation? pointDepart;
  Localisation? pointArrive;
  Distance? distance;
  Distance? duree;
  String? addresseDepart;
  String? addresseArrive;
  String? statusLivraison;
  String? statusLivraisonVehicule;
  String? statusCourses;
  String? statusDate;
  String? dateCourses;
  Client? client;
  int? prixTotal;
  int? prixOffre;
  String? id;

  CourseModel(
      {this.transaction,
      this.mobilite,
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
      this.statusDate,
      this.dateCourses,
      this.client,
      this.prixTotal,
      this.prixOffre,
      this.id});

  CourseModel.fromJson(Map<String, dynamic> json) {
    transaction = json['transaction'] != null
        ? new Transaction.fromJson(json['transaction'])
        : null;
    mobilite = json['mobilite'] != null
        ? new Mobilite.fromJson(json['mobilite'])
        : null;
    commande = json['commande'];
    pointDepart = json['pointDepart'] != null
        ? new Localisation.fromJson(json['pointDepart'])
        : null;
    pointArrive = json['pointArrive'] != null
        ? new Localisation.fromJson(json['pointArrive'])
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
    if (this.mobilite != null) {
      data['mobilite'] = this.mobilite!.toJson();
    }
    data['commande'] = this.commande;
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

  static List<CourseModel> fromList({required data}) {
    List<CourseModel> liste = [];

    for (var element in data) {
      liste.add(CourseModel.fromJson(element));
    }

    return liste;
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

class Mobilite {
  String? typeVehicule;
  Localisation? localisation;
  String? typeLuxe;
  String? pays;
  String? online;
  String? nomEntreprise;
  String? nom;
  String? prenom;
  String? marque;
  String? modelVehicule;
  String? couleur;
  String? immatriculation;
  String? descriptionEntreprise;
  String? telephone;
  String? email;
  List<String>? notes;
  List<String>? courses;
  String? status;
  String? service;
  String? idParent;
  PhotoProfile? photoProfile;
  String? pieceIdentite;
  String? permisConduire;
  PhotoProfile? photoVehicule;
  String? assurance;
  String? carteGrise;
  String? walletDriver;
  String? id;

  Mobilite(
      {this.typeVehicule,
      this.localisation,
      this.typeLuxe,
      this.pays,
      this.online,
      this.nomEntreprise,
      this.nom,
      this.prenom,
      this.marque,
      this.modelVehicule,
      this.couleur,
      this.immatriculation,
      this.descriptionEntreprise,
      this.telephone,
      this.email,
      this.notes,
      this.courses,
      this.status,
      this.service,
      this.idParent,
      this.photoProfile,
      this.pieceIdentite,
      this.permisConduire,
      this.photoVehicule,
      this.assurance,
      this.carteGrise,
      this.walletDriver,
      this.id});

  Mobilite.fromJson(Map<String, dynamic> json) {
    typeVehicule = json['typeVehicule'];
    localisation = json['localisation'] != null
        ? new Localisation.fromJson(json['localisation'])
        : null;
    typeLuxe = json['typeLuxe'];
    pays = json['pays'];
    online = json['online'];
    nomEntreprise = json['nomEntreprise'];
    nom = json['nom'];
    prenom = json['prenom'];
    marque = json['marque'];
    modelVehicule = json['modelVehicule'];
    couleur = json['couleur'];
    immatriculation = json['immatriculation'];
    descriptionEntreprise = json['descriptionEntreprise'];
    telephone = json['telephone'];
    email = json['email'];
    notes = json['notes'].cast<String>();

    courses = json['courses'].cast<String>();

    status = json['status'];
    service = json['service'];
    idParent = json['idParent'];
    photoProfile = json['photoProfile'] != null
        ? new PhotoProfile.fromJson(json['photoProfile'])
        : null;
    pieceIdentite = json['pieceIdentite'];
    permisConduire = json['permisConduire'];
    photoVehicule = json['photoVehicule'] != null
        ? new PhotoProfile.fromJson(json['photoVehicule'])
        : null;
    assurance = json['assurance'];
    carteGrise = json['carteGrise'];
    walletDriver = json['walletDriver'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typeVehicule'] = this.typeVehicule;
    if (this.localisation != null) {
      data['localisation'] = this.localisation!.toJson();
    }
    data['typeLuxe'] = this.typeLuxe;
    data['pays'] = this.pays;
    data['online'] = this.online;
    data['nomEntreprise'] = this.nomEntreprise;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['marque'] = this.marque;
    data['modelVehicule'] = this.modelVehicule;
    data['couleur'] = this.couleur;
    data['immatriculation'] = this.immatriculation;
    data['descriptionEntreprise'] = this.descriptionEntreprise;
    data['telephone'] = this.telephone;
    data['email'] = this.email;
    data['notes'] = this.notes;

    data['status'] = this.status;
    data['service'] = this.service;
    data['idParent'] = this.idParent;
    if (this.photoProfile != null) {
      data['photoProfile'] = this.photoProfile!.toJson();
    }
    data['pieceIdentite'] = this.pieceIdentite;
    data['permisConduire'] = this.permisConduire;
    if (this.photoVehicule != null) {
      data['photoVehicule'] = this.photoVehicule!.toJson();
    }
    data['assurance'] = this.assurance;
    data['carteGrise'] = this.carteGrise;
    data['walletDriver'] = this.walletDriver;
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

class PhotoProfile {
  String? date;
  String? url;
  String? type;
  String? id;

  PhotoProfile({this.date, this.url, this.type, this.id});

  PhotoProfile.fromJson(Map<String, dynamic> json) {
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
