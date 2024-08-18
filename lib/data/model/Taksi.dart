class Taksi {
  String? id;
  String? qrCode;
  String? categoryId;
  String? categoryName;
  String? title;
  String? seotitle;
  String? description;
  String? image;
  String? lat;
  String? lng;
  String? rate;

  Taksi(
      {this.id,
        this.qrCode,
        this.categoryId,
        this.categoryName,
        this.title,
        this.seotitle,
        this.description,
        this.image,
        this.lat,
        this.lng,
        this.rate});

  Taksi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qrCode = json['qr_code'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    title = json['title'];
    seotitle = json['seotitle'];
    description = json['description'];
    image = json['image'];
    lat = json['lat'];
    lng = json['lng'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qr_code'] = this.qrCode;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['title'] = this.title;
    data['seotitle'] = this.seotitle;
    data['description'] = this.description;
    data['image'] = this.image;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['rate'] = this.rate;
    return data;
  }
}
