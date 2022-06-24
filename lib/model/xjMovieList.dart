class XjMovieListRes {
  int retcode;
  String errmsg;
  Data data;

  XjMovieListRes({this.retcode, this.errmsg, this.data});

  XjMovieListRes.fromJson(Map<String, dynamic> json) {
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
  int now;
  String action;
  String sampleParams;
  Params params;
  List<Vodrows> vodrows;
  Pageinfo pageinfo;
  List<KeyValue> orders;
  List<Categories> categories;
  List<Areas> areas;
  List<Years> years;
  List<KeyValue> definitions;
  List<KeyValue> durations;
  List<KeyValue> freetypes;
  List<KeyValue> mosaics;
  List<KeyValue> langvoices;

  Data(
      {this.now,
      this.action,
      this.sampleParams,
      this.params,
      this.vodrows,
      this.pageinfo,
      this.orders,
      this.categories,
      this.areas,
      this.years,
      this.definitions,
      this.durations,
      this.freetypes,
      this.mosaics,
      this.langvoices});

  Data.fromJson(Map<String, dynamic> json) {
    now = json['now'];
    action = json['action'];
    sampleParams = json['sample_params'];
    params =
        json['params'] != null ? new Params.fromJson(json['params']) : null;
    if (json['vodrows'] != null) {
      vodrows = [];
      json['vodrows'].forEach((v) {
        vodrows.add(new Vodrows.fromJson(v));
      });
    }
    pageinfo = json['pageinfo'] != null
        ? new Pageinfo.fromJson(json['pageinfo'])
        : null;
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders.add(new KeyValue.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['areas'] != null) {
      areas = [];
      json['areas'].forEach((v) {
        areas.add(new Areas.fromJson(v));
      });
    }
    if (json['years'] != null) {
      years = [];
      json['years'].forEach((v) {
        years.add(new Years.fromJson(v));
      });
    }
    if (json['definitions'] != null) {
      definitions = [];
      json['definitions'].forEach((v) {
        definitions.add(new KeyValue.fromJson(v));
      });
    }
    if (json['durations'] != null) {
      durations = [];
      json['durations'].forEach((v) {
        durations.add(new KeyValue.fromJson(v));
      });
    }
    if (json['freetypes'] != null) {
      freetypes = [];
      json['freetypes'].forEach((v) {
        freetypes.add(new KeyValue.fromJson(v));
      });
    }
    if (json['mosaics'] != null) {
      mosaics = [];
      json['mosaics'].forEach((v) {
        mosaics.add(new KeyValue.fromJson(v));
      });
    }
    if (json['langvoices'] != null) {
      langvoices = [];
      json['langvoices'].forEach((v) {
        langvoices.add(new KeyValue.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['now'] = this.now;
    data['action'] = this.action;
    data['sample_params'] = this.sampleParams;
    if (this.params != null) {
      data['params'] = this.params.toJson();
    }
    if (this.vodrows != null) {
      data['vodrows'] = this.vodrows.map((v) => v.toJson()).toList();
    }
    if (this.pageinfo != null) {
      data['pageinfo'] = this.pageinfo.toJson();
    }
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.areas != null) {
      data['areas'] = this.areas.map((v) => v.toJson()).toList();
    }
    if (this.years != null) {
      data['years'] = this.years.map((v) => v.toJson()).toList();
    }
    if (this.definitions != null) {
      data['definitions'] = this.definitions.map((v) => v.toJson()).toList();
    }
    if (this.durations != null) {
      data['durations'] = this.durations.map((v) => v.toJson()).toList();
    }
    if (this.freetypes != null) {
      data['freetypes'] = this.freetypes.map((v) => v.toJson()).toList();
    }
    if (this.mosaics != null) {
      data['mosaics'] = this.mosaics.map((v) => v.toJson()).toList();
    }
    if (this.langvoices != null) {
      data['langvoices'] = this.langvoices.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Params {
  String cateid;
  String areaid;
  String yearid;
  String definition;
  String duration;
  String freetype;
  String mosaic;
  String langvoice;
  String orderby;
  dynamic page;

  Params(
      {this.cateid,
      this.areaid,
      this.yearid,
      this.definition,
      this.duration,
      this.freetype,
      this.mosaic,
      this.langvoice,
      this.orderby,
      this.page});

  Params.fromJson(Map<String, dynamic> json) {
    cateid = json['cateid'];
    areaid = json['areaid'];
    yearid = json['yearid'];
    definition = json['definition'];
    duration = json['duration'];
    freetype = json['freetype'];
    mosaic = json['mosaic'];
    langvoice = json['langvoice'];
    orderby = json['orderby'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cateid'] = this.cateid;
    data['areaid'] = this.areaid;
    data['yearid'] = this.yearid;
    data['definition'] = this.definition;
    data['duration'] = this.duration;
    data['freetype'] = this.freetype;
    data['mosaic'] = this.mosaic;
    data['langvoice'] = this.langvoice;
    data['orderby'] = this.orderby;
    data['page'] = this.page;
    return data;
  }
}

class Vodrows {
  String vodid;
  String title;
  String intro;
  String coverpic;
  String createtime;
  String updatetime;
  String vodkey;
  String scorenum;
  String upnum;
  String downnum;
  String authorid;
  String author;
  String playUrl;
  String downUrl;
  String definition;
  String duration;
  String yearid;
  String yearname;
  String mosaic;
  String portrait;
  String viewPrice;
  int limitFree;
  String isvip;
  String islimit;
  String islimitv3;
  int exclusive;
  String commentcount;
  int playcountTotal;
  dynamic downcountTotal;
  List<Tags> tags;
  List<Tags> actorTags;
  String areaid;
  String areaname;
  String cateid;
  String catename;
  List<Null> playlist;
  List<Null> downlist;
  String episodeTotal;
  String episodeStatus;
  int playindex;

  Vodrows(
      {this.vodid,
      this.title,
      this.intro,
      this.coverpic,
      this.createtime,
      this.updatetime,
      this.vodkey,
      this.scorenum,
      this.upnum,
      this.downnum,
      this.authorid,
      this.author,
      this.playUrl,
      this.downUrl,
      this.definition,
      this.duration,
      this.yearid,
      this.yearname,
      this.mosaic,
      this.portrait,
      this.viewPrice,
      this.limitFree,
      this.isvip,
      this.islimit,
      this.islimitv3,
      this.exclusive,
      this.commentcount,
      this.playcountTotal,
      this.downcountTotal,
      this.tags,
      this.actorTags,
      this.areaid,
      this.areaname,
      this.cateid,
      this.catename,
      this.playlist,
      this.downlist,
      this.episodeTotal,
      this.episodeStatus,
      this.playindex});

  Vodrows.fromJson(Map<String, dynamic> json) {
    vodid = json['vodid'];
    title = json['title'];
    intro = json['intro'];
    coverpic = json['coverpic'];
    createtime = json['createtime'];
    updatetime = json['updatetime'];
    vodkey = json['vodkey'];
    scorenum = json['scorenum'];
    upnum = json['upnum'];
    downnum = json['downnum'];
    authorid = json['authorid'];
    author = json['author'];
    playUrl = json['play_url'];
    downUrl = json['down_url'];
    definition = json['definition'];
    duration = json['duration'];
    yearid = json['yearid'];
    yearname = json['yearname'];
    mosaic = json['mosaic'];
    portrait = json['portrait'];
    viewPrice = json['view_price'];
    limitFree = json['limit_free'];
    isvip = json['isvip'];
    islimit = json['islimit'];
    islimitv3 = json['islimitv3'];
    exclusive = json['exclusive'];
    commentcount = json['commentcount'];
    playcountTotal = json['playcount_total'];
    downcountTotal = json['downcount_total'];
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    if (json['actor_tags'] != null) {
      actorTags = [];
      json['actor_tags'].forEach((v) {
        actorTags.add(new Tags.fromJson(v));
      });
    }
    areaid = json['areaid'];
    areaname = json['areaname'];
    cateid = json['cateid'];
    catename = json['catename'];
    // if (json['playlist'] != null) {
    //   playlist = new List<Null>();
    //   json['playlist'].forEach((v) {
    //     playlist.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['downlist'] != null) {
    //   downlist = new List<Null>();
    //   json['downlist'].forEach((v) {
    //     downlist.add(new Null.fromJson(v));
    //   });
    // }
    episodeTotal = json['episode_total'];
    episodeStatus = json['episode_status'];
    playindex = json['playindex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vodid'] = this.vodid;
    data['title'] = this.title;
    data['intro'] = this.intro;
    data['coverpic'] = this.coverpic;
    data['createtime'] = this.createtime;
    data['updatetime'] = this.updatetime;
    data['vodkey'] = this.vodkey;
    data['scorenum'] = this.scorenum;
    data['upnum'] = this.upnum;
    data['downnum'] = this.downnum;
    data['authorid'] = this.authorid;
    data['author'] = this.author;
    data['play_url'] = this.playUrl;
    data['down_url'] = this.downUrl;
    data['definition'] = this.definition;
    data['duration'] = this.duration;
    data['yearid'] = this.yearid;
    data['yearname'] = this.yearname;
    data['mosaic'] = this.mosaic;
    data['portrait'] = this.portrait;
    data['view_price'] = this.viewPrice;
    data['limit_free'] = this.limitFree;
    data['isvip'] = this.isvip;
    data['islimit'] = this.islimit;
    data['islimitv3'] = this.islimitv3;
    data['exclusive'] = this.exclusive;
    data['commentcount'] = this.commentcount;
    data['playcount_total'] = this.playcountTotal;
    data['downcount_total'] = this.downcountTotal;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    if (this.actorTags != null) {
      data['actor_tags'] = this.actorTags.map((v) => v.toJson()).toList();
    }
    data['areaid'] = this.areaid;
    data['areaname'] = this.areaname;
    data['cateid'] = this.cateid;
    data['catename'] = this.catename;
    // if (this.playlist != null) {
    //   data['playlist'] = this.playlist.map((v) => v.toJson()).toList();
    // }
    // if (this.downlist != null) {
    //   data['downlist'] = this.downlist.map((v) => v.toJson()).toList();
    // }
    data['episode_total'] = this.episodeTotal;
    data['episode_status'] = this.episodeStatus;
    data['playindex'] = this.playindex;
    return data;
  }
}

class Tags {
  String tagid;
  String tagtype;
  String tagname;
  String itemcount;

  Tags({this.tagid, this.tagtype, this.tagname, this.itemcount});

  Tags.fromJson(Map<String, dynamic> json) {
    tagid = json['tagid'];
    tagtype = json['tagtype'];
    tagname = json['tagname'];
    itemcount = json['itemcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagid'] = this.tagid;
    data['tagtype'] = this.tagtype;
    data['tagname'] = this.tagname;
    data['itemcount'] = this.itemcount;
    return data;
  }
}

class Pageinfo {
  List<Plist> plist;
  int pagesize;
  int total;
  int totalpage;
  int page;
  int start;
  int end;
  int prev;
  int next;
  String currUrl;
  String firstUrl;
  String prevUrl;
  String nextUrl;
  String lastUrl;
  String pageUrl;
  List<int> pages;

  Pageinfo(
      {this.plist,
      this.pagesize,
      this.total,
      this.totalpage,
      this.page,
      this.start,
      this.end,
      this.prev,
      this.next,
      this.currUrl,
      this.firstUrl,
      this.prevUrl,
      this.nextUrl,
      this.lastUrl,
      this.pageUrl,
      this.pages});

  Pageinfo.fromJson(Map<String, dynamic> json) {
    if (json['plist'] != null) {
      plist = [];
      json['plist'].forEach((v) {
        plist.add(new Plist.fromJson(v));
      });
    }
    pagesize = json['pagesize'];
    total = json['total'];
    totalpage = json['totalpage'];
    page = json['page'];
    start = json['start'];
    end = json['end'];
    prev = json['prev'];
    next = json['next'];
    currUrl = json['curr_url'];
    firstUrl = json['first_url'];
    prevUrl = json['prev_url'];
    nextUrl = json['next_url'];
    lastUrl = json['last_url'];
    pageUrl = json['page_url'];
    pages = json['pages'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plist != null) {
      data['plist'] = this.plist.map((v) => v.toJson()).toList();
    }
    data['pagesize'] = this.pagesize;
    data['total'] = this.total;
    data['totalpage'] = this.totalpage;
    data['page'] = this.page;
    data['start'] = this.start;
    data['end'] = this.end;
    data['prev'] = this.prev;
    data['next'] = this.next;
    data['curr_url'] = this.currUrl;
    data['first_url'] = this.firstUrl;
    data['prev_url'] = this.prevUrl;
    data['next_url'] = this.nextUrl;
    data['last_url'] = this.lastUrl;
    data['page_url'] = this.pageUrl;
    data['pages'] = this.pages;
    return data;
  }
}

class Plist {
  String pos;
  int page;
  dynamic text;
  String url;

  Plist({this.pos, this.page, this.text, this.url});

  Plist.fromJson(Map<String, dynamic> json) {
    pos = json['pos'];
    page = json['page'];
    text = json['text'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pos'] = this.pos;
    data['page'] = this.page;
    data['text'] = this.text;
    data['url'] = this.url;
    return data;
  }
}

class KeyValue {
  int keyid;
  String value;

  KeyValue({this.keyid, this.value});

  KeyValue.fromJson(Map<String, dynamic> json) {
    keyid = json['keyid'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keyid'] = this.keyid;
    data['value'] = this.value;
    return data;
  }
}

class Categories {
  String cateid;
  String parentid;
  String uuid;
  String catename;

  Categories({this.cateid, this.parentid, this.uuid, this.catename});

  Categories.fromJson(Map<String, dynamic> json) {
    cateid = json['cateid'];
    parentid = json['parentid'];
    uuid = json['uuid'];
    catename = json['catename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cateid'] = this.cateid;
    data['parentid'] = this.parentid;
    data['uuid'] = this.uuid;
    data['catename'] = this.catename;
    return data;
  }
}

class Areas {
  String areaid;
  String areaname;
  String sortnum;

  Areas({this.areaid, this.areaname, this.sortnum});

  Areas.fromJson(Map<String, dynamic> json) {
    areaid = json['areaid'];
    areaname = json['areaname'];
    sortnum = json['sortnum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['areaid'] = this.areaid;
    data['areaname'] = this.areaname;
    data['sortnum'] = this.sortnum;
    return data;
  }
}

class Years {
  String yearid;
  String yearname;
  String sortnum;

  Years({this.yearid, this.yearname, this.sortnum});

  Years.fromJson(Map<String, dynamic> json) {
    yearid = json['yearid'];
    yearname = json['yearname'];
    sortnum = json['sortnum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yearid'] = this.yearid;
    data['yearname'] = this.yearname;
    data['sortnum'] = this.sortnum;
    return data;
  }
}
