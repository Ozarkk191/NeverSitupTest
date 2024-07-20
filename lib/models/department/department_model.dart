class DepartmentModel {
  String? name;
  String? imageUrl;
  String? id;

  DepartmentModel({
    this.name,
    this.imageUrl,
    this.id,
  });

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    return data;
  }
}
