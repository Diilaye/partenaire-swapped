class OffreSpecialRestaurantsModel {
  String? pays;
  List<Complements>? complements;
  List<Plats>? plats;
  bool? isDisponible;
  bool? isLivraible;
  bool? isFreeLivraison;
  String? idRestaurant;
  Galery? galery;
  String? titre;
  String? dateDebut;
  String? dateFin;
  int? pourcentage;
  String? id;

  OffreSpecialRestaurantsModel(
      {this.pays,
      this.complements,
      this.plats,
      this.isDisponible,
      this.isLivraible,
      this.isFreeLivraison,
      this.idRestaurant,
      this.galery,
      this.titre,
      this.dateDebut,
      this.dateFin,
      this.pourcentage,
      this.id});

  OffreSpecialRestaurantsModel.fromJson(Map<String, dynamic> json) {
    pays = json['pays'];
    if (json['complements'] != null) {
      complements = <Complements>[];
      json['complements'].forEach((v) {
        complements!.add(new Complements.fromJson(v));
      });
    }
    if (json['plats'] != null) {
      plats = <Plats>[];
      json['plats'].forEach((v) {
        plats!.add(new Plats.fromJson(v));
      });
    }
    isDisponible = json['isDisponible'];
    isLivraible = json['isLivraible'];
    isFreeLivraison = json['isFreeLivraison'];
    idRestaurant = json['idRestaurant'];
    galery =
        json['galery'] != null ? new Galery.fromJson(json['galery']) : null;
    titre = json['titre'];
    dateDebut = json['dateDebut'];
    dateFin = json['dateFin'];
    pourcentage = json['pourcentage'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pays'] = this.pays;
    if (this.complements != null) {
      data['complements'] = this.complements!.map((v) => v.toJson()).toList();
    }
    if (this.plats != null) {
      data['plats'] = this.plats!.map((v) => v.toJson()).toList();
    }
    data['isDisponible'] = this.isDisponible;
    data['isLivraible'] = this.isLivraible;
    data['isFreeLivraison'] = this.isFreeLivraison;
    data['idRestaurant'] = this.idRestaurant;
    if (this.galery != null) {
      data['galery'] = this.galery!.toJson();
    }
    data['titre'] = this.titre;
    data['dateDebut'] = this.dateDebut;
    data['dateFin'] = this.dateFin;
    data['pourcentage'] = this.pourcentage;
    data['id'] = this.id;
    return data;
  }

  static List<OffreSpecialRestaurantsModel> fromList({required List data}) {
    List<OffreSpecialRestaurantsModel> liste = [];

    for (var element in data) {
      liste.add(OffreSpecialRestaurantsModel.fromJson(element));
    }
    return liste;
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

class Plats {
  List<String>? menu;
  bool? isFreeLivraison;
  List<Galery>? galery;
  String? specialite;
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

  Plats(
      {this.menu,
      this.isFreeLivraison,
      this.galery,
      this.specialite,
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

  Plats.fromJson(Map<String, dynamic> json) {
    menu = json['menu'].cast<String>();
    isFreeLivraison = json['isFreeLivraison'];
    if (json['galery'] != null) {
      galery = <Galery>[];
      json['galery'].forEach((v) {
        galery!.add(new Galery.fromJson(v));
      });
    }
    specialite = json['specialite'];
    pays = json['pays'];
    if (json['complements'] != null) {
      complements = <Complements>[];
      json['complements'].forEach((v) {
        complements!.add(new Complements.fromJson(v));
      });
    }
    // if (json['commandes'] != null) {
    //   commandes = <Null>[];
    //   json['commandes'].forEach((v) {
    //     commandes!.add(new Null.fromJson(v));
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
    isLivrable = json['isLivrable'];
    titre = json['titre'];
    description = json['description'];
    tarif = json['tarif'];
    idRestaurant = json['idRestaurant'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu'] = this.menu;
    data['isFreeLivraison'] = this.isFreeLivraison;
    if (this.galery != null) {
      data['galery'] = this.galery!.map((v) => v.toJson()).toList();
    }
    data['specialite'] = this.specialite;
    data['pays'] = this.pays;
    if (this.complements != null) {
      data['complements'] = this.complements!.map((v) => v.toJson()).toList();
    }
    // if (this.commandes != null) {
    //   data['commandes'] = this.commandes!.map((v) => v.toJson()).toList();
    // }
    // if (this.notes != null) {
    //   data['notes'] = this.notes!.map((v) => v.toJson()).toList();
    // }
    // if (this.commentaires != null) {
    //   data['commentaires'] = this.commentaires!.map((v) => v.toJson()).toList();
    // }
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
