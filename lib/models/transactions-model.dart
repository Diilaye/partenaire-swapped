class TransactionsModels {
  String? url;
  Data? data;
  String? status;

  TransactionsModels({this.url, this.data, this.status});

  TransactionsModels.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? status;
  String? typeService;
  String? type;
  String? dateTransactionSuccess;
  String? amount;
  String? client;
  String? justificatif;
  String? service;
  String? token;
  String? id;

  Data(
      {this.status,
      this.typeService,
      this.type,
      this.dateTransactionSuccess,
      this.amount,
      this.client,
      this.justificatif,
      this.service,
      this.token,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    typeService = json['typeService'];
    type = json['type'];
    dateTransactionSuccess = json['dateTransactionSuccess'];
    amount = json['amount'];
    client = json['client'];
    justificatif = json['justificatif'];
    service = json['service'];
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['typeService'] = this.typeService;
    data['type'] = this.type;
    data['dateTransactionSuccess'] = this.dateTransactionSuccess;
    data['amount'] = this.amount;
    data['client'] = this.client;
    data['justificatif'] = this.justificatif;
    data['service'] = this.service;
    data['token'] = this.token;
    data['id'] = this.id;
    return data;
  }
}
