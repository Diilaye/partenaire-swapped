class Restaurantmodel {
  List<String>? specialite;
  String? adresse;
  String? heureOuverture;
  String? heureFermeture;
  List<String>? jourOuvertures;
  String? nombreTable;
  String? telephone1;
  String? telephone2;
  String? nomEntreprise;
  String? descriptionEntreprise;
  String? telephone;
  String? email;
  List<Gallerie>? gallerie;
  List<Map>? notes;
  List<Map>? commentaires;
  List<Map>? plats;
  List<Map>? specialMenu;
  List<String>? commodite;
  String? status;
  String? service;
  String? idParent;
  Gallerie? photoCover;
  String? id;

  Restaurantmodel(
      {this.specialite,
      this.adresse,
      this.heureOuverture,
      this.heureFermeture,
      this.jourOuvertures,
      this.nombreTable,
      this.telephone1,
      this.telephone2,
      this.nomEntreprise,
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
      this.id});

  Restaurantmodel.fromJson(Map<String, dynamic> json) {
    if (json['specialite'] != null) {
      specialite = <String>[];
      json['specialite'].forEach((v) {
        specialite!.add(v);
      });
    }
    adresse = json['adresse'] ?? "";
    heureOuverture = json['heureOuverture'] ?? "";
    heureFermeture = json['heureFermeture'] ?? "";
    if (json['jourOuvertures'] != null) {
      jourOuvertures = <String>[];
      json['jourOuvertures'].forEach((v) {
        jourOuvertures!.add(v);
      });
    }
    nombreTable = json['nombreTable'];
    telephone1 = json['telephone1'];
    telephone2 = json['telephone2'];
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
    if (json['notes'] != null) {
      notes = <Map>[];
      json['notes'].forEach((v) {
        notes!.add(v);
      });
    }
    if (json['commentaires'] != null) {
      commentaires = <Map>[];
      json['commentaires'].forEach((v) {
        commentaires!.add(v);
      });
    }
    if (json['plats'] != null) {
      plats = <Map>[];
      json['plats'].forEach((v) {
        plats!.add(v);
      });
    }
    if (json['specialMenu'] != null) {
      specialMenu = <Map>[];
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
        ? new Gallerie.fromJson(json['photoCover'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['telephone1'] = this.telephone1;
    data['telephone2'] = this.telephone2;
    data['nomEntreprise'] = this.nomEntreprise;
    data['descriptionEntreprise'] = this.descriptionEntreprise;
    data['telephone'] = this.telephone;
    data['email'] = this.email;
    if (this.gallerie != null) {
      data['gallerie'] = this.gallerie!.map((v) => v.toJson()).toList();
    }

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
