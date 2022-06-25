class MovieListRes {
  int code;
  Data data;

  MovieListRes({this.code, this.data});

  MovieListRes.fromJson(Map<String, dynamic> json) {
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
  List<MList> list;
  List<Ad> ad;

  Data({this.list, this.ad});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list.add(new MList.fromJson(v));
      });
    }
    if (json['ad'] != null) {
      ad = [];
      json['ad'].forEach((v) {
        ad.add(new Ad.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    if (this.ad != null) {
      data['ad'] = this.ad.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MList {
  int id;
  int type;
  String title;
  int vip;
  int jing;
  String number;
  String img;
  String url;
  int state;
  int navId;
  String time;
  int hot;
  int cTime;
  num zanLv;
  int like;
  int isAd;
  int playtime;

  MList(
      {this.id,
      this.type,
      this.title,
      this.vip,
      this.jing,
      this.number,
      this.img,
      this.url,
      this.state,
      this.navId,
      this.time,
      this.hot,
      this.cTime,
      this.zanLv,
      this.like,
      this.isAd,
      this.playtime});

  MList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    vip = json['vip'];
    jing = json['jing'];
    number = json['number'];
    img = json['img'];
    url = json['url'];
    state = json['state'];
    navId = json['nav_id'];
    time = json['time'];
    hot = json['hot'];
    cTime = json['c_time'];
    zanLv = json['zan_lv'];
    like = json['like'];
    isAd = json['is_ad'];
    playtime = json['playtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['title'] = this.title;
    data['vip'] = this.vip;
    data['jing'] = this.jing;
    data['number'] = this.number;
    data['img'] = this.img;
    data['url'] = this.url;
    data['state'] = this.state;
    data['nav_id'] = this.navId;
    data['time'] = this.time;
    data['hot'] = this.hot;
    data['c_time'] = this.cTime;
    data['zan_lv'] = this.zanLv;
    data['like'] = this.like;
    data['is_ad'] = this.isAd;
    data['playtime'] = this.playtime;
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
