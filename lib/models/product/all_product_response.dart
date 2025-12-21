class AllProductResponse {
  List<Data>? data;
  String? message;

  AllProductResponse({this.data, this.message});

  AllProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? category;
  int? qty;
  String? desc;
  String? url;

  Data({this.id, this.name, this.category, this.qty, this.desc, this.url});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    qty = json['qty'];
    desc = json['desc'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['qty'] = this.qty;
    data['desc'] = this.desc;
    data['url'] = this.url;
    return data;
  }
}