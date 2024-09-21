class Taksi {
  final List<Data>? data;

  const Taksi({this.data});

  Taksi.fromJson(Map<String, dynamic> json)
      : data = (json['data'] != null)
      ? List<Data>.from(json['data'].map((v) => Data.fromJson(v)))
      : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  final String? title;
  final int? totalCount;
  final List<SubCategories>? subCategories;

  const Data({this.title, this.totalCount, this.subCategories});

  Data.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        totalCount = json['total_count'],
        subCategories = (json['sub_categories'] != null)
            ? List<SubCategories>.from(json['sub_categories']
            .map((v) => SubCategories.fromJson(v)))
            : null;

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
  final String? title;
  final int? totalCount;
  final List<Contents>? contents;

  const SubCategories({this.title, this.totalCount, this.contents});

  SubCategories.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        totalCount = json['total_count'],
        contents = (json['contents'] != null)
            ? List<Contents>.from(
            json['contents'].map((v) => Contents.fromJson(v)))
            : null;

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
  final String? title;
  final String? address;
  final Location? location;

  const Contents({this.title, this.address, this.location});

  Contents.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        address = json['address'],
        location = json['location'] != null
            ? Location.fromJson(json['location'])
            : null;

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
  final double? lat;
  final double? lon;

  const Location({this.lat, this.lon});

  Location.fromJson(Map<String, dynamic> json)
      : lat = json['lat'],
        lon = json['lon'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}
