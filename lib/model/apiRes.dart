class ApiRes {
  String vip;
  String xjIp;
  String xjApi;

  ApiRes({this.vip, this.xjIp, this.xjApi});

  ApiRes.fromJson(Map<String, dynamic> json) {
    vip = json['vip'];
    xjIp = json['xjIp'];
    xjApi = json['xjApi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vip'] = this.vip;
    data['xjIp'] = this.xjIp;
    data['xjApi'] = this.xjApi;
    return data;
  }
}
