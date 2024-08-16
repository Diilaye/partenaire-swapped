class FindVehiculeModel {
  Info? info;
  Vehicule? vehicule;

  FindVehiculeModel({this.info, this.vehicule});

  FindVehiculeModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    vehicule = json['vehicule'] != null
        ? new Vehicule.fromJson(json['vehicule'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    if (this.vehicule != null) {
      data['vehicule'] = this.vehicule!.toJson();
    }
    return data;
  }

  static List<FindVehiculeModel> fromList({required data}) {
    List<FindVehiculeModel> liste = [];

    for (var element in data) {
      liste.add(FindVehiculeModel.fromJson(element));
    }

    return liste;
  }
}

class Info {
  Distance? distance;
  Distance? duration;
  String? status;

  Info({this.distance, this.duration, this.status});

  Info.fromJson(Map<String, dynamic> json) {
    distance = json['distance'] != null
        ? new Distance.fromJson(json['distance'])
        : null;
    duration = json['duration'] != null
        ? new Distance.fromJson(json['duration'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.distance != null) {
      data['distance'] = this.distance!.toJson();
    }
    if (this.duration != null) {
      data['duration'] = this.duration!.toJson();
    }
    data['status'] = this.status;
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

class Vehicule {
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

  String? status;
  String? service;
  String? idParent;
  String? photoProfile;
  String? walletDriver;
  String? id;

  Vehicule(
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
      this.status,
      this.service,
      this.idParent,
      this.photoProfile,
      this.walletDriver,
      this.id});

  Vehicule.fromJson(Map<String, dynamic> json) {
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

    status = json['status'];
    service = json['service'];
    idParent = json['idParent'];
    photoProfile = json['photoProfile'];
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

    data['status'] = this.status;
    data['service'] = this.service;
    data['idParent'] = this.idParent;
    data['photoProfile'] = this.photoProfile;
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
