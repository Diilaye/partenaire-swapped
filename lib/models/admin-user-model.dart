class AdminUserModel {
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
      {this.service,
      this.nom,
      this.prenom,
      this.telephone,
      this.email,
      this.date,
      this.identifiant,
      this.token,
      this.id});

  AdminUserModel.fromJson(Map<String, dynamic> json) {
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
