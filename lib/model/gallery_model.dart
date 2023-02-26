class GalleryModel {
  String? id;
  String? createdAt;
  String? color;
  Map<String, dynamic>? url;
  String? name;

  GalleryModel({
    this.color,
    this.createdAt,
    this.id,
    this.url,
    this.name,
  });

  GalleryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    color = json['color'];
    url = json['urls'];
    name = json['name'];
  }
}
