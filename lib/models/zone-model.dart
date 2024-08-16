class ZoneModel {
  String? title;
  List<SubZone>? subZone;
  String? id;

  ZoneModel({this.title, this.subZone, this.id});

  ZoneModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['subZone'] != null) {
      subZone = <SubZone>[];
      json['subZone'].forEach((v) {
        subZone!.add(new SubZone.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.subZone != null) {
      data['subZone'] = this.subZone!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }

  static List<ZoneModel> fromList({required data}) {
    List<ZoneModel> liste = [];

    for (var element in data) {
      liste.add(ZoneModel.fromJson(element));
    }

    return liste;
  }
}

class SubZone {
  String? arrive;
  int? prix;

  SubZone({this.arrive, this.prix});

  SubZone.fromJson(Map<String, dynamic> json) {
    arrive = json['arrive'];
    prix = json['prix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arrive'] = this.arrive;
    data['prix'] = this.prix;
    return data;
  }
}
