class CateRes {
  int code;
  Data data;

  CateRes({this.code, this.data});

  CateRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Ad> ad;
  List<CateList> list;

  Data({this.ad, this.list});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['ad'] != null) {
      ad = [];
      json['ad'].forEach((v) {
        ad.add(new Ad.fromJson(v));
      });
    }
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list.add(new CateList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ad != null) {
      data['ad'] = this.ad.map((v) => v.toJson()).toList();
    }
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ad {
  int id;
  String url;
  String img;
  int type;
  String des;
  int isAd;

  Ad({this.id, this.url, this.img, this.type, this.des, this.isAd});

  Ad.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    img = json['img'];
    type = json['type'];
    des = json['des'];
    isAd = json['is_ad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['img'] = this.img;
    data['type'] = this.type;
    data['des'] = this.des;
    data['is_ad'] = this.isAd;
    return data;
  }
}

class CateList {
  int id;
  String name;
  int orderNumber;
  String img;
  int cTime;

  CateList({this.id, this.name, this.orderNumber, this.img, this.cTime});

  CateList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    orderNumber = json['order_number'];
    img = json['img'];
    cTime = json['c_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['order_number'] = this.orderNumber;
    data['img'] = this.img;
    data['c_time'] = this.cTime;
    return data;
  }
}
