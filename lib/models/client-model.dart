class ClientModel {
  String? nom;
  String? prenom;
  String? sexe;
  String? email;
  String? statusCompte;
  String? telephone;
  String? token;
  String? id;

  ClientModel(
      {this.nom,
      this.prenom,
      this.sexe,
      this.email,
      this.statusCompte,
      this.telephone,
      this.token,
      this.id});

  ClientModel.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    prenom = json['prenom'];
    sexe = json['sexe'];
    email = json['email'];
    statusCompte = json['statusCompte'];
    telephone = json['telephone'];
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['sexe'] = this.sexe;
    data['email'] = this.email;
    data['statusCompte'] = this.statusCompte;
    data['telephone'] = this.telephone;
    data['token'] = this.token;
    data['id'] = this.id;
    return data;
  }

  static List<ClientModel> fromList({required data}) {
    List<ClientModel> liste = [];

    for (var element in data) {
      liste.add(ClientModel.fromJson(element));
    }
    return liste;
  }
}
