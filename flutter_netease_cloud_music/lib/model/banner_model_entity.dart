import 'dart:convert' show json;

class BannersList {
  List<Banners> banners;
  int code;

	BannersList({
    this.banners,
    this.code,
  });

  factory BannersList.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Banners> banners = jsonRes['banners'] is List ? [] : null;
    if (banners != null) {
      for (var item in jsonRes['banners']) {
        if (item != null) {
          banners.add(Banners.fromJson(item));
        }
      }
    }
    return BannersList(
      banners: banners,
      code: jsonRes['code'],
    );
  }

  Map<String, dynamic> toJson() => {
        'banners': banners,
        'code': code,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Banners {
  String pic;
  int targetId;
  Object adid;
  int targetType;
  String titleColor;
  String typeTitle;
  Object url;
  Object adurlV2;
  bool exclusive;
  Object monitorImpress;
  Object monitorClick;
  Object monitorType;
  List<Object> monitorImpressList;
  List<Object> monitorClickList;
  Object monitorBlackList;
  Object extMonitor;
  Object extMonitorInfo;
  Object adSource;
  Object adLocation;
  String encodeId;
  Object program;
  Object event;
  Object video;
  Song song;
  String bannerId;
  Object alg;
  String scm;
  String requestId;
  bool showAdTag;
  Object pid;
  Object showContext;
  Object adDispatchJson;

  Banners({
    this.pic,
    this.targetId,
    this.adid,
    this.targetType,
    this.titleColor,
    this.typeTitle,
    this.url,
    this.adurlV2,
    this.exclusive,
    this.monitorImpress,
    this.monitorClick,
    this.monitorType,
    this.monitorImpressList,
    this.monitorClickList,
    this.monitorBlackList,
    this.extMonitor,
    this.extMonitorInfo,
    this.adSource,
    this.adLocation,
    this.encodeId,
    this.program,
    this.event,
    this.video,
    this.song,
    this.bannerId,
    this.alg,
    this.scm,
    this.requestId,
    this.showAdTag,
    this.pid,
    this.showContext,
    this.adDispatchJson,
  });

  factory Banners.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Object> monitorImpressList =
        jsonRes['monitorImpressList'] is List ? [] : null;
    if (monitorImpressList != null) {
      for (var item in jsonRes['monitorImpressList']) {
        if (item != null) {
          monitorImpressList.add(item);
        }
      }
    }

    List<Object> monitorClickList =
        jsonRes['monitorClickList'] is List ? [] : null;
    if (monitorClickList != null) {
      for (var item in jsonRes['monitorClickList']) {
        if (item != null) {
          monitorClickList.add(item);
        }
      }
    }
    return Banners(
      pic: jsonRes['pic'],
      targetId: jsonRes['targetId'],
      adid: jsonRes['adid'],
      targetType: jsonRes['targetType'],
      titleColor: jsonRes['titleColor'],
      typeTitle: jsonRes['typeTitle'],
      url: jsonRes['url'],
      adurlV2: jsonRes['adurlV2'],
      exclusive: jsonRes['exclusive'],
      monitorImpress: jsonRes['monitorImpress'],
      monitorClick: jsonRes['monitorClick'],
      monitorType: jsonRes['monitorType'],
      monitorImpressList: monitorImpressList,
      monitorClickList: monitorClickList,
      monitorBlackList: jsonRes['monitorBlackList'],
      extMonitor: jsonRes['extMonitor'],
      extMonitorInfo: jsonRes['extMonitorInfo'],
      adSource: jsonRes['adSource'],
      adLocation: jsonRes['adLocation'],
      encodeId: jsonRes['encodeId'],
      program: jsonRes['program'],
      event: jsonRes['event'],
      video: jsonRes['video'],
      song: Song.fromJson(jsonRes['song']),
      bannerId: jsonRes['bannerId'],
      alg: jsonRes['alg'],
      scm: jsonRes['scm'],
      requestId: jsonRes['requestId'],
      showAdTag: jsonRes['showAdTag'],
      pid: jsonRes['pid'],
      showContext: jsonRes['showContext'],
      adDispatchJson: jsonRes['adDispatchJson'],
    );
  }

  Map<String, dynamic> toJson() => {
        'pic': pic,
        'targetId': targetId,
        'adid': adid,
        'targetType': targetType,
        'titleColor': titleColor,
        'typeTitle': typeTitle,
        'url': url,
        'adurlV2': adurlV2,
        'exclusive': exclusive,
        'monitorImpress': monitorImpress,
        'monitorClick': monitorClick,
        'monitorType': monitorType,
        'monitorImpressList': monitorImpressList,
        'monitorClickList': monitorClickList,
        'monitorBlackList': monitorBlackList,
        'extMonitor': extMonitor,
        'extMonitorInfo': extMonitorInfo,
        'adSource': adSource,
        'adLocation': adLocation,
        'encodeId': encodeId,
        'program': program,
        'event': event,
        'video': video,
        'song': song,
        'bannerId': bannerId,
        'alg': alg,
        'scm': scm,
        'requestId': requestId,
        'showAdTag': showAdTag,
        'pid': pid,
        'showContext': showContext,
        'adDispatchJson': adDispatchJson,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Song {
  String name;
  int id;
  int pst;
  int t;
  List<Ar> ar;
  List<Object> alia;
  int pop;
  int st;
  String rt;
  int fee;
  int v;
  Object crbt;
  String cf;
  Al al;
  int dt;
  H h;
  M m;
  L l;
  Object a;
  String cd;
  int no;
  Object rtUrl;
  int ftype;
  List<Object> rtUrls;
  int djId;
  int copyright;
  int s_id;
  int mark;
  int mst;
  int cp;
  int mv;
  int rtype;
  Object rurl;
  int publishTime;
  Privilege privilege;

  Song({
    this.name,
    this.id,
    this.pst,
    this.t,
    this.ar,
    this.alia,
    this.pop,
    this.st,
    this.rt,
    this.fee,
    this.v,
    this.crbt,
    this.cf,
    this.al,
    this.dt,
    this.h,
    this.m,
    this.l,
    this.a,
    this.cd,
    this.no,
    this.rtUrl,
    this.ftype,
    this.rtUrls,
    this.djId,
    this.copyright,
    this.s_id,
    this.mark,
    this.mst,
    this.cp,
    this.mv,
    this.rtype,
    this.rurl,
    this.publishTime,
    this.privilege,
  });

  factory Song.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Ar> ar = jsonRes['ar'] is List ? [] : null;
    if (ar != null) {
      for (var item in jsonRes['ar']) {
        if (item != null) {
          ar.add(Ar.fromJson(item));
        }
      }
    }

    List<Object> alia = jsonRes['alia'] is List ? [] : null;
    if (alia != null) {
      for (var item in jsonRes['alia']) {
        if (item != null) {
          alia.add(item);
        }
      }
    }

    List<Object> rtUrls = jsonRes['rtUrls'] is List ? [] : null;
    if (rtUrls != null) {
      for (var item in jsonRes['rtUrls']) {
        if (item != null) {
          rtUrls.add(item);
        }
      }
    }
    return Song(
      name: jsonRes['name'],
      id: jsonRes['id'],
      pst: jsonRes['pst'],
      t: jsonRes['t'],
      ar: ar,
      alia: alia,
      pop: jsonRes['pop'],
      st: jsonRes['st'],
      rt: jsonRes['rt'],
      fee: jsonRes['fee'],
      v: jsonRes['v'],
      crbt: jsonRes['crbt'],
      cf: jsonRes['cf'],
      al: Al.fromJson(jsonRes['al']),
      dt: jsonRes['dt'],
      h: H.fromJson(jsonRes['h']),
      m: M.fromJson(jsonRes['m']),
      l: L.fromJson(jsonRes['l']),
      a: jsonRes['a'],
      cd: jsonRes['cd'],
      no: jsonRes['no'],
      rtUrl: jsonRes['rtUrl'],
      ftype: jsonRes['ftype'],
      rtUrls: rtUrls,
      djId: jsonRes['djId'],
      copyright: jsonRes['copyright'],
      s_id: jsonRes['s_id'],
      mark: jsonRes['mark'],
      mst: jsonRes['mst'],
      cp: jsonRes['cp'],
      mv: jsonRes['mv'],
      rtype: jsonRes['rtype'],
      rurl: jsonRes['rurl'],
      publishTime: jsonRes['publishTime'],
      privilege: Privilege.fromJson(jsonRes['privilege']),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'pst': pst,
        't': t,
        'ar': ar,
        'alia': alia,
        'pop': pop,
        'st': st,
        'rt': rt,
        'fee': fee,
        'v': v,
        'crbt': crbt,
        'cf': cf,
        'al': al,
        'dt': dt,
        'h': h,
        'm': m,
        'l': l,
        'a': a,
        'cd': cd,
        'no': no,
        'rtUrl': rtUrl,
        'ftype': ftype,
        'rtUrls': rtUrls,
        'djId': djId,
        'copyright': copyright,
        's_id': s_id,
        'mark': mark,
        'mst': mst,
        'cp': cp,
        'mv': mv,
        'rtype': rtype,
        'rurl': rurl,
        'publishTime': publishTime,
        'privilege': privilege,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Ar {
  int id;
  String name;
  List<Object> tns;
  List<Object> alias;

  Ar({
    this.id,
    this.name,
    this.tns,
    this.alias,
  });

  factory Ar.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Object> tns = jsonRes['tns'] is List ? [] : null;
    if (tns != null) {
      for (var item in jsonRes['tns']) {
        if (item != null) {
          tns.add(item);
        }
      }
    }

    List<Object> alias = jsonRes['alias'] is List ? [] : null;
    if (alias != null) {
      for (var item in jsonRes['alias']) {
        if (item != null) {
          alias.add(item);
        }
      }
    }
    return Ar(
      id: jsonRes['id'],
      name: jsonRes['name'],
      tns: tns,
      alias: alias,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'tns': tns,
        'alias': alias,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Al {
  int id;
  String name;
  String picUrl;
  List<Object> tns;
  String pic_str;
  int pic;

  Al({
    this.id,
    this.name,
    this.picUrl,
    this.tns,
    this.pic_str,
    this.pic,
  });

  factory Al.fromJson(jsonRes) {
    if (jsonRes == null) return null;

    List<Object> tns = jsonRes['tns'] is List ? [] : null;
    if (tns != null) {
      for (var item in jsonRes['tns']) {
        if (item != null) {
          tns.add(item);
        }
      }
    }
    return Al(
      id: jsonRes['id'],
      name: jsonRes['name'],
      picUrl: jsonRes['picUrl'],
      tns: tns,
      pic_str: jsonRes['pic_str'],
      pic: jsonRes['pic'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'picUrl': picUrl,
        'tns': tns,
        'pic_str': pic_str,
        'pic': pic,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class H {
  int br;
  int fid;
  int size;
  int vd;

  H({
    this.br,
    this.fid,
    this.size,
    this.vd,
  });

  factory H.fromJson(jsonRes) => jsonRes == null
      ? null
      : H(
          br: jsonRes['br'],
          fid: jsonRes['fid'],
          size: jsonRes['size'],
          vd: jsonRes['vd'],
        );

  Map<String, dynamic> toJson() => {
        'br': br,
        'fid': fid,
        'size': size,
        'vd': vd,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class M {
  int br;
  int fid;
  int size;
  int vd;

  M({
    this.br,
    this.fid,
    this.size,
    this.vd,
  });

  factory M.fromJson(jsonRes) => jsonRes == null
      ? null
      : M(
          br: jsonRes['br'],
          fid: jsonRes['fid'],
          size: jsonRes['size'],
          vd: jsonRes['vd'],
        );

  Map<String, dynamic> toJson() => {
        'br': br,
        'fid': fid,
        'size': size,
        'vd': vd,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class L {
  int br;
  int fid;
  int size;
  int vd;

  L({
    this.br,
    this.fid,
    this.size,
    this.vd,
  });

  factory L.fromJson(jsonRes) => jsonRes == null
      ? null
      : L(
          br: jsonRes['br'],
          fid: jsonRes['fid'],
          size: jsonRes['size'],
          vd: jsonRes['vd'],
        );

  Map<String, dynamic> toJson() => {
        'br': br,
        'fid': fid,
        'size': size,
        'vd': vd,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Privilege {
  int id;
  int fee;
  int payed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  bool toast;
  int flag;
  bool preSell;

  Privilege({
    this.id,
    this.fee,
    this.payed,
    this.st,
    this.pl,
    this.dl,
    this.sp,
    this.cp,
    this.subp,
    this.cs,
    this.maxbr,
    this.fl,
    this.toast,
    this.flag,
    this.preSell,
  });

  factory Privilege.fromJson(jsonRes) => jsonRes == null
      ? null
      : Privilege(
          id: jsonRes['id'],
          fee: jsonRes['fee'],
          payed: jsonRes['payed'],
          st: jsonRes['st'],
          pl: jsonRes['pl'],
          dl: jsonRes['dl'],
          sp: jsonRes['sp'],
          cp: jsonRes['cp'],
          subp: jsonRes['subp'],
          cs: jsonRes['cs'],
          maxbr: jsonRes['maxbr'],
          fl: jsonRes['fl'],
          toast: jsonRes['toast'],
          flag: jsonRes['flag'],
          preSell: jsonRes['preSell'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fee': fee,
        'payed': payed,
        'st': st,
        'pl': pl,
        'dl': dl,
        'sp': sp,
        'cp': cp,
        'subp': subp,
        'cs': cs,
        'maxbr': maxbr,
        'fl': fl,
        'toast': toast,
        'flag': flag,
        'preSell': preSell,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
