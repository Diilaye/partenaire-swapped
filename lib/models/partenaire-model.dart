import 'package:partenaire/models/file-model.dart';

class PartenaireModel {
  String? service;
  String? nomEntreprise;
  String? descriptionEntreprise;
  String? nomInterlocuteur;
  String? prenomInterlocuteur;
  String? telephoneInterlocuteur;
  List<FileModel>? photoExterieur;
  List<FileModel>? photoInterne;
  String? localisation;
  String? dateRv;
  String? heureRv;
  String? date;
  String? id;

  PartenaireModel(
      {this.service,
      this.nomEntreprise,
      this.descriptionEntreprise,
      this.nomInterlocuteur,
      this.prenomInterlocuteur,
      this.telephoneInterlocuteur,
      this.photoExterieur,
      this.photoInterne,
      this.localisation,
      this.dateRv,
      this.heureRv,
      this.date,
      this.id});

  PartenaireModel.fromJson(Map<String, dynamic> json) {
    service = json['service'];
    nomEntreprise = json['nomEntreprise'];
    descriptionEntreprise = json['descriptionEntreprise'];
    nomInterlocuteur = json['nomInterlocuteur'];
    prenomInterlocuteur = json['prenomInterlocuteur'];
    telephoneInterlocuteur = json['telephoneInterlocuteur'];
    if (json['photoExterieur'] != null) {
      photoExterieur = <FileModel>[];
      json['photoExterieur'].forEach((v) {
        photoExterieur!.add(FileModel.fromJson(v));
      });
    }
    if (json['photoInterne'] != null) {
      photoInterne = <FileModel>[];
      json['photoInterne'].forEach((v) {
        photoInterne!.add(FileModel.fromJson(v));
      });
    }
    localisation = json['localisation'];
    dateRv = json['dateRv'];
    heureRv = json['heureRv'];
    date = json['date'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service'] = this.service;
    data['nomEntreprise'] = this.nomEntreprise;
    data['descriptionEntreprise'] = this.descriptionEntreprise;
    data['nomInterlocuteur'] = this.nomInterlocuteur;
    data['prenomInterlocuteur'] = this.prenomInterlocuteur;
    data['telephoneInterlocuteur'] = this.telephoneInterlocuteur;
    if (this.photoExterieur != null) {
      data['photoExterieur'] =
          this.photoExterieur!.map((v) => v.toJson()).toList();
    }
    if (this.photoInterne != null) {
      data['photoInterne'] = this.photoInterne!.map((v) => v.toJson()).toList();
    }
    data['localisation'] = this.localisation;
    data['dateRv'] = this.dateRv;
    data['heureRv'] = this.heureRv;
    data['date'] = this.date;
    data['id'] = this.id;
    return data;
  }

  static List<PartenaireModel> fromList({required data}) {
    List<PartenaireModel> liste = [];

    for (var element in data) {
      liste.add(PartenaireModel.fromJson(element));
    }
    return liste;
  }
}
