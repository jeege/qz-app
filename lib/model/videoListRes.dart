class VideoList {
  String type;
  List<Data> data;
  String ep;
  List<Y> y;
  int sp;

  VideoList({this.type, this.data, this.ep, this.y, this.sp});

  VideoList.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    ep = json['ep'];
    if (json['y'] != null) {
      y = <Y>[];
      json['y'].forEach((v) {
        y.add(new Y.fromJson(v));
      });
    }
    sp = json['sp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['ep'] = this.ep;
    if (this.y != null) {
      data['y'] = this.y.map((v) => v.toJson()).toList();
    }
    data['sp'] = this.sp;
    return data;
  }
}

class Data {
  String name;
  String year;
  Source source;

  Data({this.name, this.year, this.source});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    year = json['year'];
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['year'] = this.year;
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    return data;
  }
}

class Source {
  List<Eps> eps;

  Source({this.eps});

  Source.fromJson(Map<String, dynamic> json) {
    if (json['eps'] != null) {
      eps = <Eps>[];
      json['eps'].forEach((v) {
        eps.add(new Eps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eps != null) {
      data['eps'] = this.eps.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Eps {
  String name;
  String url;

  Eps({this.name, this.url});

  Eps.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Y {
  String tType;
  String showName;
  String showType;
  String clickType;
  String clickContent;
  String clickId;

  Y(
      {this.tType,
      this.showName,
      this.showType,
      this.clickType,
      this.clickContent,
      this.clickId});

  Y.fromJson(Map<String, dynamic> json) {
    tType = json['tType'];
    showName = json['showName'];
    showType = json['showType'];
    clickType = json['clickType'];
    clickContent = json['clickContent'];
    clickId = json['clickId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tType'] = this.tType;
    data['showName'] = this.showName;
    data['showType'] = this.showType;
    data['clickType'] = this.clickType;
    data['clickContent'] = this.clickContent;
    data['clickId'] = this.clickId;
    return data;
  }
}
