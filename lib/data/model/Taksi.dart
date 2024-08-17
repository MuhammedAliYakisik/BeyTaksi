class Taksi {
  String? iLCE;
  String? kAPINO;
  double? eNLEM;
  String? aCIKLAMA;
  String? iLCEID;
  String? mAHALLE;
  Null? mAHALLEID;
  String? aDI;
  double? bOYLAM;
  String? yOL;

  Taksi(
      {this.iLCE,
        this.kAPINO,
        this.eNLEM,
        this.aCIKLAMA,
        this.iLCEID,
        this.mAHALLE,
        this.mAHALLEID,
        this.aDI,
        this.bOYLAM,
        this.yOL});

  Taksi.fromJson(Map<String, dynamic> json) {
    iLCE = json['ILCE'];
    kAPINO = json['KAPINO'];
    eNLEM = json['ENLEM'];
    aCIKLAMA = json['ACIKLAMA'];
    iLCEID = json['ILCEID'];
    mAHALLE = json['MAHALLE'];
    mAHALLEID = json['MAHALLEID'];
    aDI = json['ADI'];
    bOYLAM = json['BOYLAM'];
    yOL = json['YOL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ILCE'] = this.iLCE;
    data['KAPINO'] = this.kAPINO;
    data['ENLEM'] = this.eNLEM;
    data['ACIKLAMA'] = this.aCIKLAMA;
    data['ILCEID'] = this.iLCEID;
    data['MAHALLE'] = this.mAHALLE;
    data['MAHALLEID'] = this.mAHALLEID;
    data['ADI'] = this.aDI;
    data['BOYLAM'] = this.bOYLAM;
    data['YOL'] = this.yOL;
    return data;
  }
}
