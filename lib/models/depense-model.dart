class DepenseDashbordModel {
  List<Depenses>? depenses;
  List<Livraison>? livraison;
  Motard? motard;
  int? charge;
  int? chiffreAffaire;
  int? revenuNette;
  int? salaire;

  DepenseDashbordModel(
      {this.depenses,
      this.livraison,
      this.motard,
      this.charge,
      this.chiffreAffaire,
      this.revenuNette,
      this.salaire});

  DepenseDashbordModel.fromJson(Map<String, dynamic> json) {
    if (json['depenses'] != null) {
      depenses = <Depenses>[];
      json['depenses'].forEach((v) {
        depenses!.add(new Depenses.fromJson(v));
      });
    }
    if (json['livraison'] != null) {
      livraison = <Livraison>[];
      json['livraison'].forEach((v) {
        livraison!.add(new Livraison.fromJson(v));
      });
    }
    motard =
        json['motard'] != null ? new Motard.fromJson(json['motard']) : null;
    charge = json['charge'];
    chiffreAffaire = json['chiffreAffaire'];
    revenuNette = json['revenuNette'];
    salaire = json['salaire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.depenses != null) {
      data['depenses'] = this.depenses!.map((v) => v.toJson()).toList();
    }
    if (this.livraison != null) {
      data['livraison'] = this.livraison!.map((v) => v.toJson()).toList();
    }
    if (this.motard != null) {
      data['motard'] = this.motard!.toJson();
    }
    data['charge'] = this.charge;
    data['chiffreAffaire'] = this.chiffreAffaire;
    data['revenuNette'] = this.revenuNette;
    data['salaire'] = this.salaire;
    return data;
  }

  static List<DepenseDashbordModel> fromList({required data}) {
    List<DepenseDashbordModel> liste = [];

    for (var element in data) {
      liste.add(DepenseDashbordModel.fromJson(element));
    }

    return liste;
  }
}

class Depenses {
  String? mobilite;
  String? title;
  String? dateCourses;
  int? prix;
  String? moto;
  String? id;

  Depenses(
      {this.mobilite,
      this.title,
      this.dateCourses,
      this.prix,
      this.moto,
      this.id});

  Depenses.fromJson(Map<String, dynamic> json) {
    mobilite = json['mobilite'];
    title = json['title'];
    dateCourses = json['dateCourses'];
    prix = json['prix'];
    moto = json['moto'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobilite'] = this.mobilite;
    data['title'] = this.title;
    data['dateCourses'] = this.dateCourses;
    data['prix'] = this.prix;
    data['moto'] = this.moto;
    data['id'] = this.id;
    return data;
  }
}

class Livraison {
  String? clientPhone;
  String? mobilite;
  String? addresseDepart;
  String? addresseArrive;
  String? dateCourses;
  int? prixLivraison;
  int? prixRepas;
  String? id;

  Livraison(
      {this.clientPhone,
      this.mobilite,
      this.addresseDepart,
      this.addresseArrive,
      this.dateCourses,
      this.prixLivraison,
      this.prixRepas,
      this.id});

  Livraison.fromJson(Map<String, dynamic> json) {
    clientPhone = json['clientPhone'];
    mobilite = json['mobilite'];
    addresseDepart = json['addresseDepart'];
    addresseArrive = json['addresseArrive'];
    dateCourses = json['dateCourses'];
    prixLivraison = json['prix_livraison'];
    prixRepas = json['prix_repas'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientPhone'] = this.clientPhone;
    data['mobilite'] = this.mobilite;
    data['addresseDepart'] = this.addresseDepart;
    data['addresseArrive'] = this.addresseArrive;
    data['dateCourses'] = this.dateCourses;
    data['prix_livraison'] = this.prixLivraison;
    data['prix_repas'] = this.prixRepas;
    data['id'] = this.id;
    return data;
  }
}

class Motard {
  String? nom;
  String? prenom;
  String? telephone;

  Motard({this.nom, this.prenom, this.telephone});

  Motard.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    prenom = json['prenom'];
    telephone = json['telephone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['telephone'] = this.telephone;
    return data;
  }
}
