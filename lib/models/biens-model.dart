import 'package:partenaire/models/file-model.dart';

class BiensModels {
  List<FileModel>? galery;
  List<String>? commoditeChambre;
  List<String>? commoditeSalon;
  List<String>? commoditeCuisine;
  List<String>? commoditeSalleBain;
  List<String>? commoditeBuanderie;
  List<String>? commoditeJardin;
  List<String>? commoditeServiceAnnexe;
  List<Null>? reservations;
  List<Null>? notes;
  List<Null>? commentaires;
  bool? isDisponible;
  String? adresse;
  String? typeLogement;
  String? titre;
  String? nbreChambre;
  String? nbreVoyageur;
  String? nbreSalleBain;
  String? nbreMinNuit;
  String? tarif;
  String? tarifLocataireSupplementaire;
  String? tarifMenagere;
  String? id;

  BiensModels(
      {this.galery,
      this.commoditeChambre,
      this.commoditeSalon,
      this.commoditeCuisine,
      this.commoditeSalleBain,
      this.commoditeBuanderie,
      this.commoditeJardin,
      this.commoditeServiceAnnexe,
      this.reservations,
      this.notes,
      this.commentaires,
      this.isDisponible,
      this.adresse,
      this.typeLogement,
      this.titre,
      this.nbreChambre,
      this.nbreVoyageur,
      this.nbreSalleBain,
      this.nbreMinNuit,
      this.tarif,
      this.tarifLocataireSupplementaire,
      this.tarifMenagere,
      this.id});

  BiensModels.fromJson(Map<String, dynamic> json) {
    if (json['galery'] != null) {
      galery = <FileModel>[];
      json['galery'].forEach((v) {
        galery!.add(FileModel.fromJson(v));
      });
    }
    commoditeChambre = json['commoditeChambre'].cast<String>();
    commoditeSalon = json['commoditeSalon'].cast<String>();
    commoditeCuisine = json['commoditeCuisine'].cast<String>();
    commoditeSalleBain = json['commoditeSalleBain'].cast<String>();
    commoditeBuanderie = json['commoditeBuanderie'].cast<String>();
    commoditeJardin = json['commoditeJardin'].cast<String>();
    commoditeServiceAnnexe = json['commoditeServiceAnnexe'].cast<String>();
    if (json['reservations'] != null) {
      reservations = <Null>[];
      json['reservations'].forEach((v) {
        reservations!.add(null);
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
    isDisponible = json['isDisponible'];
    adresse = json['adresse'];
    typeLogement = json['typeLogement'];
    titre = json['titre'];
    nbreChambre = json['nbreChambre'];
    nbreVoyageur = json['nbreVoyageur'];
    nbreSalleBain = json['nbreSalleBain'];
    nbreMinNuit = json['nbreMinNuit'];
    tarif = json['tarif'];
    tarifLocataireSupplementaire = json['tarifLocataireSupplementaire'];
    tarifMenagere = json['tarif_menagere'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.galery != null) {
      data['galery'] = this.galery!.map((v) => v.toJson()).toList();
    }
    data['commoditeChambre'] = this.commoditeChambre;
    data['commoditeSalon'] = this.commoditeSalon;
    data['commoditeCuisine'] = this.commoditeCuisine;
    data['commoditeSalleBain'] = this.commoditeSalleBain;
    data['commoditeBuanderie'] = this.commoditeBuanderie;
    data['commoditeJardin'] = this.commoditeJardin;
    data['commoditeServiceAnnexe'] = this.commoditeServiceAnnexe;

    // if (this.reservations != null) {
    //   data['reservations'] = this.reservations!.map((v) => v.toJson()).toList();
    // }
    // if (this.notes != null) {
    //   data['notes'] = this.notes!.map((v) => v.toJson()).toList();
    // }
    // if (this.commentaires != null) {
    //   data['commentaires'] = this.commentaires!.map((v) => v.toJson()).toList();
    // }

    data['isDisponible'] = this.isDisponible;
    data['adresse'] = this.adresse;
    data['typeLogement'] = this.typeLogement;
    data['titre'] = this.titre;
    data['nbreChambre'] = this.nbreChambre;
    data['nbreVoyageur'] = this.nbreVoyageur;
    data['nbreSalleBain'] = this.nbreSalleBain;
    data['nbreMinNuit'] = this.nbreMinNuit;
    data['tarif'] = this.tarif;
    data['tarifLocataireSupplementaire'] = this.tarifLocataireSupplementaire;
    data['tarif_menagere'] = this.tarifMenagere;
    data['id'] = this.id;
    return data;
  }

  static List<BiensModels> fromList({required data}) {
    List<BiensModels> liste = [];

    for (var element in data) {
      liste.add(BiensModels.fromJson(element));
    }
    return liste;
  }
}
