class Restaurantmodel {
  String? pays;
  List<String>? specialite;
  String? adresse;
  String? heureOuverture;
  String? heureFermeture;
  List<String>? jourOuvertures;
  String? nombreTable;
  String? nomEntreprise;
  String? descriptionEntreprise;
  String? telephone;
  String? telephone1;
  String? telephone2;
  String? email;
  List<Gallerie>? gallerie;
  List<Null>? notes;
  List<Null>? commentaires;
  List<String>? plats;
  List<String>? specialMenu;
  List<String>? commodite;
  String? status;
  String? service;
  String? idParent;
  Gallerie? photoCover;
  String? id;

  Restaurantmodel(
      {this.pays,
      this.specialite,
      this.adresse,
      this.heureOuverture,
      this.heureFermeture,
      this.jourOuvertures,
      this.nombreTable,
      this.nomEntreprise,
      this.descriptionEntreprise,
      this.telephone,
      this.telephone1,
      this.telephone2,
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
      this.id});

  Restaurantmodel.fromJson(Map<String, dynamic> json) {
    pays = json['pays'];
    if (json['specialite'] != null) {
      specialite = <String>[];
      json['specialite'].forEach((v) {
        specialite!.add(v);
      });
    }
    adresse = json['adresse'];
    heureOuverture = json['heureOuverture'];
    heureFermeture = json['heureFermeture'];
    if (json['jourOuvertures'] != null) {
      jourOuvertures = <String>[];
      json['jourOuvertures'].forEach((v) {
        jourOuvertures!.add(v);
      });
    }
    nombreTable = json['nombreTable'];
    nomEntreprise = json['nomEntreprise'];
    descriptionEntreprise = json['descriptionEntreprise'];
    telephone = json['telephone'];
    telephone1 = json['telephone1'];
    telephone2 = json['telephone2'];
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
    if (json['specialMenu'] != null) {
      specialMenu = <String>[];
      json['specialMenu'].forEach((v) {
        specialMenu!.add(v);
      });
    }
    if (json['commodite'] != null) {
      commodite = <String>[];
      json['commodite'].forEach((v) {
        commodite!.add(v);
      });
    }
    status = json['status'];
    service = json['service'];
    idParent = json['idParent'];
    photoCover = json['photoCover'] != null
        ? Gallerie.fromJson(json['photoCover'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pays'] = this.pays;
    if (this.specialite != null) {
      data['specialite'] = this.specialite!.map((v) => v).toList();
    }
    data['adresse'] = this.adresse;
    data['heureOuverture'] = this.heureOuverture;
    data['heureFermeture'] = this.heureFermeture;
    if (this.jourOuvertures != null) {
      data['jourOuvertures'] = this.jourOuvertures!.map((v) => v).toList();
    }
    data['nombreTable'] = this.nombreTable;
    data['nomEntreprise'] = this.nomEntreprise;
    data['descriptionEntreprise'] = this.descriptionEntreprise;
    data['telephone'] = this.telephone;
    data['telephone1'] = this.telephone1;
    data['telephone2'] = this.telephone2;
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
    // if (this.specialMenu != null) {
    //   data['specialMenu'] = this.specialMenu!.map((v) => v.toJson()).toList();
    // }
    // if (this.commodite != null) {
    //   data['commodite'] = this.commodite!.map((v) => v.toJson()).toList();
    // }
    data['status'] = this.status;
    data['service'] = this.service;
    data['idParent'] = this.idParent;
    if (this.photoCover != null) {
      data['photoCover'] = this.photoCover!.toJson();
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
