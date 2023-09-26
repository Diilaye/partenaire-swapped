class AdminUserModel {
  String? telephoneOM;
  String? telephoneMOMO;
  List<ConditionAnulation>? conditionAnulation;
  String? service;
  String? nom;
  String? prenom;
  String? telephone;
  String? email;
  String? date;
  String? identifiant;
  String? token;
  String? id;

  AdminUserModel(
      {this.telephoneOM,
      this.telephoneMOMO,
      this.conditionAnulation,
      this.service,
      this.nom,
      this.prenom,
      this.telephone,
      this.email,
      this.date,
      this.identifiant,
      this.token,
      this.id});

  AdminUserModel.fromJson(Map<String, dynamic> json) {
    telephoneOM = json['telephoneOM'];
    telephoneMOMO = json['telephoneMOMO'];
    if (json['conditionAnulation'] != null) {
      conditionAnulation = <ConditionAnulation>[];
      json['conditionAnulation'].forEach((v) {
        conditionAnulation!.add(new ConditionAnulation.fromJson(v));
      });
    }
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
    data['telephoneOM'] = this.telephoneOM;
    data['telephoneMOMO'] = this.telephoneMOMO;
    if (this.conditionAnulation != null) {
      data['conditionAnulation'] =
          this.conditionAnulation!.map((v) => v.toJson()).toList();
    }
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

class ConditionAnulation {
  String? pourcantage;
  String? jour;

  ConditionAnulation({this.pourcantage, this.jour});

  ConditionAnulation.fromJson(Map<String, dynamic> json) {
    pourcantage = json['pourcantage'];
    jour = json['jour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pourcantage'] = this.pourcantage;
    data['jour'] = this.jour;
    return data;
  }
}
