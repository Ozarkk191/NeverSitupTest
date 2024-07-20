class ProductModel {
  String? name;
  String? imageUrl;
  String? desc;
  String? price;
  String? type;
  String? id;
  String? departmentId;

  ProductModel({
    this.name,
    this.imageUrl,
    this.desc,
    this.price,
    this.type,
    this.id,
    this.departmentId,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    desc = json['desc'];
    price = json['price'];
    type = json['type'];
    id = json['id'];
    departmentId = json['departmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['desc'] = desc;
    data['price'] = price;
    data['type'] = type;
    data['id'] = id;
    data['departmentId'] = departmentId;
    return data;
  }
}
