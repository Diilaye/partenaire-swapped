class ProspectModel {
  String? nomComplet;
  String? telephone;
  String? type;
  String? typeService;
  String? id;

  ProspectModel(
      {this.nomComplet, this.telephone, this.type, this.typeService, this.id});

  ProspectModel.fromJson(Map<String, dynamic> json) {
    nomComplet = json['nomComplet'];
    telephone = json['telephone'];
    type = json['type'];
    typeService = json['typeService'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomComplet'] = this.nomComplet;
    data['telephone'] = this.telephone;
    data['type'] = this.type;
    data['typeService'] = this.typeService;
    data['id'] = this.id;
    return data;
  }
}
