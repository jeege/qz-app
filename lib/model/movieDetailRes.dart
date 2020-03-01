class MovieDetailRes {
  int code;
  Data data;

  MovieDetailRes({this.code, this.data});

  MovieDetailRes.fromJson(Map<String, dynamic> json) {
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
  int vip;
  int shikan;
  Movie movie;
  int like;
  List<MovieUrl> movieUrl;
  List<Label> label;
  num zanLv;
  int zan;
  List<Actor> actor;
  List<Ad> ad;
  List<Ad> ad1;

  Data(
      {this.vip,
      this.shikan,
      this.movie,
      this.like,
      this.movieUrl,
      this.label,
      this.zanLv,
      this.zan,
      this.actor,
      this.ad,
      this.ad1});

  Data.fromJson(Map<String, dynamic> json) {
    vip = json['vip'];
    shikan = json['shikan'];
    movie = json['movie'] != null ? new Movie.fromJson(json['movie']) : null;
    like = json['like'];
    if (json['movie_url'] != null) {
      movieUrl = new List<MovieUrl>();
      json['movie_url'].forEach((v) {
        movieUrl.add(new MovieUrl.fromJson(v));
      });
    }
    if (json['label'] != null) {
      label = new List<Label>();
      json['label'].forEach((v) {
        label.add(new Label.fromJson(v));
      });
    }
    zanLv = json['zan_lv'];
    zan = json['zan'];
    if (json['actor'] != null) {
      actor = new List<Actor>();
      json['actor'].forEach((v) {
        actor.add(new Actor.fromJson(v));
      });
    }
    if (json['ad'] != null) {
      ad = new List<Ad>();
      json['ad'].forEach((v) {
        ad.add(new Ad.fromJson(v));
      });
    }
    if (json['ad1'] != null) {
      ad1 = new List<Ad>();
      json['ad1'].forEach((v) {
        ad1.add(new Ad.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vip'] = this.vip;
    data['shikan'] = this.shikan;
    if (this.movie != null) {
      data['movie'] = this.movie.toJson();
    }
    data['like'] = this.like;
    if (this.movieUrl != null) {
      data['movie_url'] = this.movieUrl.map((v) => v.toJson()).toList();
    }
    if (this.label != null) {
      data['label'] = this.label.map((v) => v.toJson()).toList();
    }
    data['zan_lv'] = this.zanLv;
    data['zan'] = this.zan;
    if (this.actor != null) {
      data['actor'] = this.actor.map((v) => v.toJson()).toList();
    }
    if (this.ad != null) {
      data['ad'] = this.ad.map((v) => v.toJson()).toList();
    }
    if (this.ad1 != null) {
      data['ad1'] = this.ad1.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movie {
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

  Movie(
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
      this.cTime});

  Movie.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class MovieUrl {
  int mId;
  int line;
  String url;
  int type;
  String name;

  MovieUrl({this.mId, this.line, this.url, this.type, this.name});

  MovieUrl.fromJson(Map<String, dynamic> json) {
    mId = json['m_id'];
    line = json['line'];
    url = json['url'];
    type = json['type'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m_id'] = this.mId;
    data['line'] = this.line;
    data['url'] = this.url;
    data['type'] = this.type;
    data['name'] = this.name;
    return data;
  }
}

class Label {
  int id;
  String name;
  int hot;

  Label({this.id, this.name, this.hot});

  Label.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hot = json['hot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['hot'] = this.hot;
    return data;
  }
}

class Actor {
  int id;
  String name;
  String des;
  int hot;
  String photo;
  String letter;
  int cTime;
  int isLike;

  Actor(
      {this.id,
      this.name,
      this.des,
      this.hot,
      this.photo,
      this.letter,
      this.cTime,
      this.isLike});

  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    des = json['des'];
    hot = json['hot'];
    photo = json['photo'];
    letter = json['letter'];
    cTime = json['c_time'];
    isLike = json['is_like'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['des'] = this.des;
    data['hot'] = this.hot;
    data['photo'] = this.photo;
    data['letter'] = this.letter;
    data['c_time'] = this.cTime;
    data['is_like'] = this.isLike;
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
