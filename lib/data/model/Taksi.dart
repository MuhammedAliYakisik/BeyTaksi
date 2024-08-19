class Taksi {
  List<Data>? data;

  Taksi({this.data});

  Taksi.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? title;
  int? totalCount;
  List<SubCategories>? subCategories;

  Data({this.title, this.totalCount, this.subCategories});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    totalCount = json['total_count'];
    if (json['sub_categories'] != null) {
      subCategories = [];
      json['sub_categories'].forEach((v) {
        subCategories!.add(SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = this.title;
    data['total_count'] = this.totalCount;
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  String? title;
  int? totalCount;
  List<Contents>? contents;

  SubCategories({this.title, this.totalCount, this.contents});

  SubCategories.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    totalCount = json['total_count'];
    if (json['contents'] != null) {
      contents = [];
      json['contents'].forEach((v) {
        contents!.add(Contents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = this.title;
    data['total_count'] = this.totalCount;
    if (this.contents != null) {
      data['contents'] = this.contents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contents {
  String? title;
  String? address;
  Location? location;

  Contents({this.title, this.address, this.location});

  Contents.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    address = json['address'];
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = this.title;
    data['address'] = this.address;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {
  double? lat;
  double? lon;

  Location({this.lat, this.lon});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}
