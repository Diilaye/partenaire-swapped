class PlatsRestaurantsModel {
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

  PlatsRestaurantsModel(
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

  PlatsRestaurantsModel.fromJson(Map<String, dynamic> json) {
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

  static List<PlatsRestaurantsModel> fromList({required data}) {
    List<PlatsRestaurantsModel> liste = [];

    for (var element in data) {
      liste.add(PlatsRestaurantsModel.fromJson(element));
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
