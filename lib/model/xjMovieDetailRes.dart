class XjMovieDetailRes {
  int retcode;
  String errmsg;
  Data data;

  XjMovieDetailRes({this.retcode, this.errmsg, this.data});

  XjMovieDetailRes.fromJson(Map<String, dynamic> json) {
    retcode = json['retcode'];
    errmsg = json['errmsg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['retcode'] = this.retcode;
    data['errmsg'] = this.errmsg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String xxxApiAuth;
  int isfavorite;
  String httpurl;
  String httpurlPreview;

  Data({this.xxxApiAuth, this.isfavorite, this.httpurl});

  Data.fromJson(Map<String, dynamic> json) {
    xxxApiAuth = json['xxx_api_auth'];
    isfavorite = json['isfavorite'];
    httpurl = json['httpurl'];
    httpurlPreview = json['httpurl_preview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xxx_api_auth'] = this.xxxApiAuth;
    data['isfavorite'] = this.isfavorite;
    data['httpurl'] = this.httpurl;
    data['httpurl_preview'] = this.httpurlPreview;
    return data;
  }
}
