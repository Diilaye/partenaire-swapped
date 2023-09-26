class ClientModel {
  String? nom;
  String? prenom;
  String? sexe;
  String? email;
  String? statusCompte;
  String? telephoneMOMO;
  String? token;
  String? telephoneOM;
  String? id;

  ClientModel(
      {this.nom,
      this.prenom,
      this.sexe,
      this.email,
      this.statusCompte,
      this.telephoneMOMO,
      this.token,
      this.telephoneOM,
      this.id});

  ClientModel.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    prenom = json['prenom'];
    sexe = json['sexe'];
    email = json['email'];
    statusCompte = json['statusCompte'];
    telephoneMOMO = json['telephoneMOMO'];
    token = json['token'];
    telephoneOM = json['telephoneOM'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['sexe'] = this.sexe;
    data['email'] = this.email;
    data['statusCompte'] = this.statusCompte;
    data['telephoneMOMO'] = this.telephoneMOMO;
    data['token'] = this.token;
    data['telephoneOM'] = this.telephoneOM;
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
