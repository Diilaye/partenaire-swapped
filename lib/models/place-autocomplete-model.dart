class PlaceAutocomplete {
  String? description;
  List<Terms>? terms;

  PlaceAutocomplete({
    this.description,
    this.terms,
  });

  PlaceAutocomplete.fromJson(Map<String, dynamic> json) {
    description = json['description'];

    if (json['terms'] != null) {
      terms = <Terms>[];
      json['terms'].forEach((v) {
        terms!.add(new Terms.fromJson(v));
      });
    }
  }

  static List<PlaceAutocomplete> fromList({required data}) {
    List<PlaceAutocomplete> liste = [];

    for (var element in data) {
      liste.add(PlaceAutocomplete.fromJson(element));
    }
    return liste;
  }
}

class Terms {
  int? offset;
  String? value;

  Terms({this.offset, this.value});

  Terms.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['value'] = this.value;
    return data;
  }
}
