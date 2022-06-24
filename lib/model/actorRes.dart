class ActorRes {
  int code;
  List<Data> data;

  ActorRes({this.code, this.data});

  ActorRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String des;
  int hot;
  String photo;
  String letter;
  int cTime;
  int isLike;

  Data(
      {this.id,
      this.name,
      this.des,
      this.hot,
      this.photo,
      this.letter,
      this.cTime,
      this.isLike});

  Data.fromJson(Map<String, dynamic> json) {
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
