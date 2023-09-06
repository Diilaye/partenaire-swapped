import 'package:partenaire/models/biens-model.dart';
import 'package:partenaire/models/file-model.dart';

class LogementModel {
  String? nomEntreprise;
  String? descriptionEntreprise;
  String? telephone;
  String? email;
  List<FileModel>? gallerie;
  List<Null>? notes;
  List<Null>? commentaires;
  List<BiensModels>? biens;
  String? status;
  String? service;
  String? idParent;
  FileModel? photoCover;
  String? id;

  LogementModel(
      {this.nomEntreprise,
      this.descriptionEntreprise,
      this.telephone,
      this.email,
      this.gallerie,
      this.notes,
      this.commentaires,
      this.biens,
      this.status,
      this.service,
      this.idParent,
      this.photoCover,
      this.id});

  LogementModel.fromJson(Map<String, dynamic> json) {
    nomEntreprise = json['nomEntreprise'];
    descriptionEntreprise = json['descriptionEntreprise'];
    telephone = json['telephone'];
    email = json['email'];
    if (json['gallerie'] != null) {
      gallerie = <FileModel>[];
      json['gallerie'].forEach((v) {
        gallerie!.add(new FileModel.fromJson(v));
      });
    }
    if (json['notes'] != null) {
      notes = <Null>[];
      json['notes'].forEach((v) {
        notes!.add(null);
      });
    }
    if (json['commentaires'] != null) {
      commentaires = <Null>[];
      json['commentaires'].forEach((v) {
        commentaires!.add(null);
      });
    }
    if (json['biens'] != null) {
      biens = <BiensModels>[];
      json['biens'].forEach((v) {
        biens!.add(new BiensModels.fromJson(v));
      });
    }
    status = json['status'];
    service = json['service'];
    idParent = json['idParent'];
    photoCover = json['photoCover'] != null
        ? new FileModel.fromJson(json['photoCover'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomEntreprise'] = this.nomEntreprise;
    data['descriptionEntreprise'] = this.descriptionEntreprise;
    data['telephone'] = this.telephone;
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
    if (this.biens != null) {
      data['biens'] = this.biens!.map((v) => v.toJson()).toList();
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
