class MessageModel {
  String? text;
  String? statusSender;
  String? id;

  MessageModel({this.text, this.statusSender, this.id});

  MessageModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    statusSender = json['statusSender'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['statusSender'] = this.statusSender;
    data['id'] = this.id;
    return data;
  }
}
