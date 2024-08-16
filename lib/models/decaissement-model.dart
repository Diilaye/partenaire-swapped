class DecaissementModel {
  String? title;
  int? minPrice;
  int? maxPrice;
  String? id;

  DecaissementModel({this.title, this.minPrice, this.maxPrice, this.id});

  DecaissementModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    minPrice = json['minPrice'];
    maxPrice = json['maxPrice'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['minPrice'] = this.minPrice;
    data['maxPrice'] = this.maxPrice;
    data['id'] = this.id;
    return data;
  }

  static List<DecaissementModel> fromList({required data}) {
    List<DecaissementModel> liste = [];

    for (var element in data) {
      liste.add(DecaissementModel.fromJson(element));
    }

    return liste;
  }
}
