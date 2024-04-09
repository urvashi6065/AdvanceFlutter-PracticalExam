// To parse this JSON data, do
//
//     final countryApiModel = countryApiModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CountryApiModel> countryApiModelFromJson(String str) => List<CountryApiModel>.from(json.decode(str).map((x) => CountryApiModel.fromJson(x)));

String countryApiModelToJson(List<CountryApiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryApiModel {
  Name name;
  List<String> tld;
  String cca2;
  String ccn3;
  String cca3;
  String cioc;
  bool independent;
  Status status;
  bool unMember;
  // Currencies currencies;
  Idd idd;
  List<String> capital;
  List<String> altSpellings;
  Region region;
  String subregion;
  Map<String, String> languages;
  Map<String, Translation> translations;
  List<double> latlng;
  bool landlocked;
  double area;

  String flag;
  Maps maps;
  int population;
  // Map<String, double> gini;
  String fifa;
  Car car;
  List<String> timezones;
  List<Continent> continents;
  Flags flags;
  CoatOfArms coatOfArms;
  StartOfWeek startOfWeek;
  CapitalInfo capitalInfo;
  PostalCode? postalCode;
  List<String> borders;

  CountryApiModel({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    // required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.area,

    required this.flag,
    required this.maps,
    required this.population,
    // required this.gini,
    required this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    required this.postalCode,
    required this.borders,
  });

  factory CountryApiModel.fromJson(Map<String, dynamic> json) => CountryApiModel(
    name: Name.fromJson(json["name"]),
    tld: json["tld"]==null?[]:List<String>.from(json["tld"].map((x) => x)),
    cca2: json["cca2"]??'',
    ccn3: json["ccn3"]??'',
    cca3: json["cca3"]??'',
    cioc: json["cioc"]??'',
    independent: json["independent"]??false,
    status: statusValues.map[json["status"]]!,
    unMember: json["unMember"],
    // currencies: Currencies.fromJson(json["currencies"]),
    idd: Idd.fromJson(json["idd"]),
    capital: json["capital"]==null?[]:List<String>.from(json["capital"].map((x) => x)),
    altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
    region: regionValues.map[json["region"]]!,
    subregion: json["subregion"]??'',
    languages: json["languages"]==null?{}:Map.from(json["languages"]).map((k, v) => MapEntry<String, String>(k, v)),
    translations: Map.from(json["translations"]).map((k, v) => MapEntry<String, Translation>(k, Translation.fromJson(v))),
    latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
    landlocked: json["landlocked"],
    area: json["area"]?.toDouble(),

    flag: json["flag"],
    maps: Maps.fromJson(json["maps"]),
    population: json["population"],
    // gini: Map.from(json["gini"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    fifa: json["fifa"]??'',
    car: Car.fromJson(json["car"]),
    timezones: List<String>.from(json["timezones"].map((x) => x)),
    continents: List<Continent>.from(json["continents"].map((x) => continentValues.map[x]!)),
    flags: Flags.fromJson(json["flags"]),
    coatOfArms: CoatOfArms.fromJson(json["coatOfArms"]),
    startOfWeek: startOfWeekValues.map[json["startOfWeek"]]!,
    capitalInfo: CapitalInfo.fromJson(json["capitalInfo"]),
    postalCode:json["postalCode"] !=null? PostalCode.fromJson(json["postalCode"]) :null,
    borders:json["borders"]==null?[]: List<String>.from(json["borders"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name.toJson(),
    "tld": List<dynamic>.from(tld.map((x) => x)),
    "cca2": cca2,
    "ccn3": ccn3,
    "cca3": cca3,
    "cioc": cioc,
    "independent": independent,
    "status": statusValues.reverse[status],
    "unMember": unMember,
    // "currencies": currencies.toJson(),
    "idd": idd.toJson(),
    "capital": List<dynamic>.from(capital.map((x) => x)),
    "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
    "region": regionValues.reverse[region],
    "subregion": subregion,
    "languages": Map.from(languages).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "translations": Map.from(translations).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "latlng": List<dynamic>.from(latlng.map((x) => x)),
    "landlocked": landlocked,
    "area": area,

    "flag": flag,
    "maps": maps.toJson(),
    "population": population,
    // "gini": Map.from(gini).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "fifa": fifa,
    "car": car.toJson(),
    "timezones": List<dynamic>.from(timezones.map((x) => x)),
    "continents": List<dynamic>.from(continents.map((x) => continentValues.reverse[x])),
    "flags": flags.toJson(),
    "coatOfArms": coatOfArms.toJson(),
    "startOfWeek": startOfWeekValues.reverse[startOfWeek],
    "capitalInfo": capitalInfo.toJson(),
    "postalCode": postalCode!.toJson(),
    "borders": List<dynamic>.from(borders.map((x) => x)),
  };
}



class FavoriteModel{
  final String? image;
  final String? name;
  FavoriteModel({required this.name,required this.image});
}



class CapitalInfo {
  List<double> latlng;

  CapitalInfo({
    required this.latlng,
  });

  factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
    latlng: json["latlng"]==null?[]:List<double>.from(json["latlng"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "latlng": List<dynamic>.from(latlng.map((x) => x)),
  };
}

class Car {
  List<String> signs;
  Side side;

  Car({
    required this.signs,
    required this.side,
  });

  factory Car.fromJson(Map<String, dynamic> json) => Car(
    signs: json["signs"]==null?[]:List<String>.from(json["signs"].map((x) => x)),
    side: sideValues.map[json["side"]]!,
  );

  Map<String, dynamic> toJson() => {
    "signs": List<dynamic>.from(signs.map((x) => x)),
    "side": sideValues.reverse[side],
  };
}

enum Side {
  LEFT,
  RIGHT
}

final sideValues = EnumValues({
  "left": Side.LEFT,
  "right": Side.RIGHT
});

class CoatOfArms {
  String png;
  String svg;

  CoatOfArms({
    required this.png,
    required this.svg,
  });

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
    png: json["png"]??'',
    svg: json["svg"]??'',
  );

  Map<String, dynamic> toJson() => {
    "png": png,
    "svg": svg,
  };
}

enum Continent {
  AFRICA,
  ANTARCTICA,
  ASIA,
  EUROPE,
  NORTH_AMERICA,
  OCEANIA,
  SOUTH_AMERICA
}

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "Antarctica": Continent.ANTARCTICA,
  "Asia": Continent.ASIA,
  "Europe": Continent.EUROPE,
  "North America": Continent.NORTH_AMERICA,
  "Oceania": Continent.OCEANIA,
  "South America": Continent.SOUTH_AMERICA
});

class Currencies {
  Aed eur;
  Aed ern;
  Aed lrd;
  Aed bmd;
  Aed ckd;
  Aed nzd;
  Aed sos;
  Aed zmw;
  Aed ves;
  Aed tmt;
  Aed all;
  Aed gbp;
  Bam sdg;
  Aed usd;
  Aed xaf;
  Aed azn;
  Aed kes;
  Aed xof;
  Aed vnd;
  Aed afn;
  Aed gtq;
  Aed kwd;
  Aed stn;
  Aed kgs;
  Aed pln;
  Aed ghs;
  Aed amd;
  Aed jep;
  Aed xcd;
  Aed tjs;
  Aed etb;
  Aed dzd;
  Aed mad;
  Aed mru;
  Aed aud;
  Aed bnd;
  Aed sgd;
  Aed ron;
  Aed nok;
  Aed byn;
  Aed pab;
  Aed czk;
  Aed pkr;
  Aed pen;
  Aed bbd;
  Aed dkk;
  Aed huf;
  Aed kmf;
  Aed bdt;
  Aed fjd;
  Aed cny;
  Aed cop;
  Aed mvr;
  Aed myr;
  Aed kyd;
  Aed pyg;
  Aed uyu;
  Aed zar;
  Aed vuv;
  Aed sek;
  Aed lbp;
  Aed clp;
  Aed bzd;
  Aed gyd;
  Aed mnt;
  Aed tvd;
  Aed dop;
  Aed bob;
  Aed npr;
  Aed twd;
  Aed bgn;
  Aed mdl;
  Aed imp;
  Aed btn;
  Aed inr;
  Aed khr;
  Aed htg;
  Aed cve;
  Aed gel;
  Aed bif;
  Aed bsd;
  Aed mur;
  Aed lyd;
  Aed mwk;
  Aed mxn;
  Aed szl;
  Aed pgk;
  Aed chf;
  Aed rub;
  Aed ils;
  Aed ugx;
  Aed top;
  Aed aed;
  Aed srd;
  Aed uzs;
  Aed sar;
  Aed egp;
  Aed mga;
  Aed xpf;
  Aed cad;
  Aed gmd;
  Aed ttd;
  Aed scr;
  Aed jpy;
  Aed brl;
  Aed syp;
  Aed shp;
  Aed tzs;
  Aed irr;
  Aed krw;
  Aed wst;
  Aed jmd;
  Aed nio;
  Aed gnf;
  Aed php;
  Aed nad;
  Aed crc;
  Bam bam;
  Aed mop;
  Aed mzn;
  Aed kpw;
  Aed uah;
  Aed iqd;
  Aed aoa;
  Aed sll;
  Aed cuc;
  Aed cup;
  Aed rsd;
  Aed fok;
  Aed jod;
  Aed currenciesTry;
  Aed kid;
  Aed kzt;
  Aed gip;
  Aed isk;
  Aed qar;
  Aed mmk;
  Aed thb;
  Aed awg;
  Aed ngn;
  Aed bhd;
  Aed lak;
  Aed djf;
  Aed sbd;
  Aed ang;
  Aed fkp;
  Aed bwp;
  Aed ggp;
  Aed zwl;
  Aed lsl;
  Aed ars;
  Aed yer;
  Aed cdf;
  Aed omr;
  Aed idr;
  Aed rwf;
  Aed mkd;
  Aed tnd;
  Aed ssp;
  Aed hnl;
  Aed lkr;
  Aed hkd;

  Currencies({
    required this.eur,
    required this.ern,
    required this.lrd,
    required this.bmd,
    required this.ckd,
    required this.nzd,
    required this.sos,
    required this.zmw,
    required this.ves,
    required this.tmt,
    required this.all,
    required this.gbp,
    required this.sdg,
    required this.usd,
    required this.xaf,
    required this.azn,
    required this.kes,
    required this.xof,
    required this.vnd,
    required this.afn,
    required this.gtq,
    required this.kwd,
    required this.stn,
    required this.kgs,
    required this.pln,
    required this.ghs,
    required this.amd,
    required this.jep,
    required this.xcd,
    required this.tjs,
    required this.etb,
    required this.dzd,
    required this.mad,
    required this.mru,
    required this.aud,
    required this.bnd,
    required this.sgd,
    required this.ron,
    required this.nok,
    required this.byn,
    required this.pab,
    required this.czk,
    required this.pkr,
    required this.pen,
    required this.bbd,
    required this.dkk,
    required this.huf,
    required this.kmf,
    required this.bdt,
    required this.fjd,
    required this.cny,
    required this.cop,
    required this.mvr,
    required this.myr,
    required this.kyd,
    required this.pyg,
    required this.uyu,
    required this.zar,
    required this.vuv,
    required this.sek,
    required this.lbp,
    required this.clp,
    required this.bzd,
    required this.gyd,
    required this.mnt,
    required this.tvd,
    required this.dop,
    required this.bob,
    required this.npr,
    required this.twd,
    required this.bgn,
    required this.mdl,
    required this.imp,
    required this.btn,
    required this.inr,
    required this.khr,
    required this.htg,
    required this.cve,
    required this.gel,
    required this.bif,
    required this.bsd,
    required this.mur,
    required this.lyd,
    required this.mwk,
    required this.mxn,
    required this.szl,
    required this.pgk,
    required this.chf,
    required this.rub,
    required this.ils,
    required this.ugx,
    required this.top,
    required this.aed,
    required this.srd,
    required this.uzs,
    required this.sar,
    required this.egp,
    required this.mga,
    required this.xpf,
    required this.cad,
    required this.gmd,
    required this.ttd,
    required this.scr,
    required this.jpy,
    required this.brl,
    required this.syp,
    required this.shp,
    required this.tzs,
    required this.irr,
    required this.krw,
    required this.wst,
    required this.jmd,
    required this.nio,
    required this.gnf,
    required this.php,
    required this.nad,
    required this.crc,
    required this.bam,
    required this.mop,
    required this.mzn,
    required this.kpw,
    required this.uah,
    required this.iqd,
    required this.aoa,
    required this.sll,
    required this.cuc,
    required this.cup,
    required this.rsd,
    required this.fok,
    required this.jod,
    required this.currenciesTry,
    required this.kid,
    required this.kzt,
    required this.gip,
    required this.isk,
    required this.qar,
    required this.mmk,
    required this.thb,
    required this.awg,
    required this.ngn,
    required this.bhd,
    required this.lak,
    required this.djf,
    required this.sbd,
    required this.ang,
    required this.fkp,
    required this.bwp,
    required this.ggp,
    required this.zwl,
    required this.lsl,
    required this.ars,
    required this.yer,
    required this.cdf,
    required this.omr,
    required this.idr,
    required this.rwf,
    required this.mkd,
    required this.tnd,
    required this.ssp,
    required this.hnl,
    required this.lkr,
    required this.hkd,
  });

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
    eur: Aed.fromJson(json["EUR"]),
    ern: Aed.fromJson(json["ERN"]?? null),
    lrd: Aed.fromJson(json["LRD"]),
    bmd: Aed.fromJson(json["BMD"]),
    ckd: Aed.fromJson(json["CKD"]),
    nzd: Aed.fromJson(json["NZD"]),
    sos: Aed.fromJson(json["SOS"]),
    zmw: Aed.fromJson(json["ZMW"]),
    ves: Aed.fromJson(json["VES"]),
    tmt: Aed.fromJson(json["TMT"]),
    all: Aed.fromJson(json["ALL"]),
    gbp: Aed.fromJson(json["GBP"]),
    sdg: Bam.fromJson(json["SDG"]),
    usd: Aed.fromJson(json["USD"]),
    xaf: Aed.fromJson(json["XAF"]),
    azn: Aed.fromJson(json["AZN"]),
    kes: Aed.fromJson(json["KES"]),
    xof: Aed.fromJson(json["XOF"]),
    vnd: Aed.fromJson(json["VND"]),
    afn: Aed.fromJson(json["AFN"]),
    gtq: Aed.fromJson(json["GTQ"]),
    kwd: Aed.fromJson(json["KWD"]),
    stn: Aed.fromJson(json["STN"]),
    kgs: Aed.fromJson(json["KGS"]),
    pln: Aed.fromJson(json["PLN"]),
    ghs: Aed.fromJson(json["GHS"]),
    amd: Aed.fromJson(json["AMD"]),
    jep: Aed.fromJson(json["JEP"]),
    xcd: Aed.fromJson(json["XCD"]),
    tjs: Aed.fromJson(json["TJS"]),
    etb: Aed.fromJson(json["ETB"]),
    dzd: Aed.fromJson(json["DZD"]),
    mad: Aed.fromJson(json["MAD"]),
    mru: Aed.fromJson(json["MRU"]),
    aud: Aed.fromJson(json["AUD"]),
    bnd: Aed.fromJson(json["BND"]),
    sgd: Aed.fromJson(json["SGD"]),
    ron: Aed.fromJson(json["RON"]),
    nok: Aed.fromJson(json["NOK"]),
    byn: Aed.fromJson(json["BYN"]),
    pab: Aed.fromJson(json["PAB"]),
    czk: Aed.fromJson(json["CZK"]),
    pkr: Aed.fromJson(json["PKR"]),
    pen: Aed.fromJson(json["PEN"]),
    bbd: Aed.fromJson(json["BBD"]),
    dkk: Aed.fromJson(json["DKK"]),
    huf: Aed.fromJson(json["HUF"]),
    kmf: Aed.fromJson(json["KMF"]),
    bdt: Aed.fromJson(json["BDT"]),
    fjd: Aed.fromJson(json["FJD"]),
    cny: Aed.fromJson(json["CNY"]),
    cop: Aed.fromJson(json["COP"]),
    mvr: Aed.fromJson(json["MVR"]),
    myr: Aed.fromJson(json["MYR"]),
    kyd: Aed.fromJson(json["KYD"]),
    pyg: Aed.fromJson(json["PYG"]),
    uyu: Aed.fromJson(json["UYU"]),
    zar: Aed.fromJson(json["ZAR"]),
    vuv: Aed.fromJson(json["VUV"]),
    sek: Aed.fromJson(json["SEK"]),
    lbp: Aed.fromJson(json["LBP"]),
    clp: Aed.fromJson(json["CLP"]),
    bzd: Aed.fromJson(json["BZD"]),
    gyd: Aed.fromJson(json["GYD"]),
    mnt: Aed.fromJson(json["MNT"]),
    tvd: Aed.fromJson(json["TVD"]),
    dop: Aed.fromJson(json["DOP"]),
    bob: Aed.fromJson(json["BOB"]),
    npr: Aed.fromJson(json["NPR"]),
    twd: Aed.fromJson(json["TWD"]),
    bgn: Aed.fromJson(json["BGN"]),
    mdl: Aed.fromJson(json["MDL"]),
    imp: Aed.fromJson(json["IMP"]),
    btn: Aed.fromJson(json["BTN"]),
    inr: Aed.fromJson(json["INR"]),
    khr: Aed.fromJson(json["KHR"]),
    htg: Aed.fromJson(json["HTG"]),
    cve: Aed.fromJson(json["CVE"]),
    gel: Aed.fromJson(json["GEL"]),
    bif: Aed.fromJson(json["BIF"]),
    bsd: Aed.fromJson(json["BSD"]),
    mur: Aed.fromJson(json["MUR"]),
    lyd: Aed.fromJson(json["LYD"]),
    mwk: Aed.fromJson(json["MWK"]),
    mxn: Aed.fromJson(json["MXN"]),
    szl: Aed.fromJson(json["SZL"]),
    pgk: Aed.fromJson(json["PGK"]),
    chf: Aed.fromJson(json["CHF"]),
    rub: Aed.fromJson(json["RUB"]),
    ils: Aed.fromJson(json["ILS"]),
    ugx: Aed.fromJson(json["UGX"]),
    top: Aed.fromJson(json["TOP"]),
    aed: Aed.fromJson(json["AED"]),
    srd: Aed.fromJson(json["SRD"]),
    uzs: Aed.fromJson(json["UZS"]),
    sar: Aed.fromJson(json["SAR"]),
    egp: Aed.fromJson(json["EGP"]),
    mga: Aed.fromJson(json["MGA"]),
    xpf: Aed.fromJson(json["XPF"]),
    cad: Aed.fromJson(json["CAD"]),
    gmd: Aed.fromJson(json["GMD"]),
    ttd: Aed.fromJson(json["TTD"]),
    scr: Aed.fromJson(json["SCR"]),
    jpy: Aed.fromJson(json["JPY"]),
    brl: Aed.fromJson(json["BRL"]),
    syp: Aed.fromJson(json["SYP"]),
    shp: Aed.fromJson(json["SHP"]),
    tzs: Aed.fromJson(json["TZS"]),
    irr: Aed.fromJson(json["IRR"]),
    krw: Aed.fromJson(json["KRW"]),
    wst: Aed.fromJson(json["WST"]),
    jmd: Aed.fromJson(json["JMD"]),
    nio: Aed.fromJson(json["NIO"]),
    gnf: Aed.fromJson(json["GNF"]),
    php: Aed.fromJson(json["PHP"]),
    nad: Aed.fromJson(json["NAD"]),
    crc: Aed.fromJson(json["CRC"]),
    bam: Bam.fromJson(json["BAM"]),
    mop: Aed.fromJson(json["MOP"]),
    mzn: Aed.fromJson(json["MZN"]),
    kpw: Aed.fromJson(json["KPW"]),
    uah: Aed.fromJson(json["UAH"]),
    iqd: Aed.fromJson(json["IQD"]),
    aoa: Aed.fromJson(json["AOA"]),
    sll: Aed.fromJson(json["SLL"]),
    cuc: Aed.fromJson(json["CUC"]),
    cup: Aed.fromJson(json["CUP"]),
    rsd: Aed.fromJson(json["RSD"]),
    fok: Aed.fromJson(json["FOK"]),
    jod: Aed.fromJson(json["JOD"]),
    currenciesTry: Aed.fromJson(json["TRY"]),
    kid: Aed.fromJson(json["KID"]),
    kzt: Aed.fromJson(json["KZT"]),
    gip: Aed.fromJson(json["GIP"]),
    isk: Aed.fromJson(json["ISK"]),
    qar: Aed.fromJson(json["QAR"]),
    mmk: Aed.fromJson(json["MMK"]),
    thb: Aed.fromJson(json["THB"]),
    awg: Aed.fromJson(json["AWG"]),
    ngn: Aed.fromJson(json["NGN"]),
    bhd: Aed.fromJson(json["BHD"]),
    lak: Aed.fromJson(json["LAK"]),
    djf: Aed.fromJson(json["DJF"]),
    sbd: Aed.fromJson(json["SBD"]),
    ang: Aed.fromJson(json["ANG"]),
    fkp: Aed.fromJson(json["FKP"]),
    bwp: Aed.fromJson(json["BWP"]),
    ggp: Aed.fromJson(json["GGP"]),
    zwl: Aed.fromJson(json["ZWL"]),
    lsl: Aed.fromJson(json["LSL"]),
    ars: Aed.fromJson(json["ARS"]),
    yer: Aed.fromJson(json["YER"]),
    cdf: Aed.fromJson(json["CDF"]),
    omr: Aed.fromJson(json["OMR"]),
    idr: Aed.fromJson(json["IDR"]),
    rwf: Aed.fromJson(json["RWF"]),
    mkd: Aed.fromJson(json["MKD"]),
    tnd: Aed.fromJson(json["TND"]),
    ssp: Aed.fromJson(json["SSP"]),
    hnl: Aed.fromJson(json["HNL"]),
    lkr: Aed.fromJson(json["LKR"]),
    hkd: Aed.fromJson(json["HKD"]),
  );

  Map<String, dynamic> toJson() => {
    "EUR": eur.toJson(),
    "ERN": ern.toJson(),
    "LRD": lrd.toJson(),
    "BMD": bmd.toJson(),
    "CKD": ckd.toJson(),
    "NZD": nzd.toJson(),
    "SOS": sos.toJson(),
    "ZMW": zmw.toJson(),
    "VES": ves.toJson(),
    "TMT": tmt.toJson(),
    "ALL": all.toJson(),
    "GBP": gbp.toJson(),
    "SDG": sdg.toJson(),
    "USD": usd.toJson(),
    "XAF": xaf.toJson(),
    "AZN": azn.toJson(),
    "KES": kes.toJson(),
    "XOF": xof.toJson(),
    "VND": vnd.toJson(),
    "AFN": afn.toJson(),
    "GTQ": gtq.toJson(),
    "KWD": kwd.toJson(),
    "STN": stn.toJson(),
    "KGS": kgs.toJson(),
    "PLN": pln.toJson(),
    "GHS": ghs.toJson(),
    "AMD": amd.toJson(),
    "JEP": jep.toJson(),
    "XCD": xcd.toJson(),
    "TJS": tjs.toJson(),
    "ETB": etb.toJson(),
    "DZD": dzd.toJson(),
    "MAD": mad.toJson(),
    "MRU": mru.toJson(),
    "AUD": aud.toJson(),
    "BND": bnd.toJson(),
    "SGD": sgd.toJson(),
    "RON": ron.toJson(),
    "NOK": nok.toJson(),
    "BYN": byn.toJson(),
    "PAB": pab.toJson(),
    "CZK": czk.toJson(),
    "PKR": pkr.toJson(),
    "PEN": pen.toJson(),
    "BBD": bbd.toJson(),
    "DKK": dkk.toJson(),
    "HUF": huf.toJson(),
    "KMF": kmf.toJson(),
    "BDT": bdt.toJson(),
    "FJD": fjd.toJson(),
    "CNY": cny.toJson(),
    "COP": cop.toJson(),
    "MVR": mvr.toJson(),
    "MYR": myr.toJson(),
    "KYD": kyd.toJson(),
    "PYG": pyg.toJson(),
    "UYU": uyu.toJson(),
    "ZAR": zar.toJson(),
    "VUV": vuv.toJson(),
    "SEK": sek.toJson(),
    "LBP": lbp.toJson(),
    "CLP": clp.toJson(),
    "BZD": bzd.toJson(),
    "GYD": gyd.toJson(),
    "MNT": mnt.toJson(),
    "TVD": tvd.toJson(),
    "DOP": dop.toJson(),
    "BOB": bob.toJson(),
    "NPR": npr.toJson(),
    "TWD": twd.toJson(),
    "BGN": bgn.toJson(),
    "MDL": mdl.toJson(),
    "IMP": imp.toJson(),
    "BTN": btn.toJson(),
    "INR": inr.toJson(),
    "KHR": khr.toJson(),
    "HTG": htg.toJson(),
    "CVE": cve.toJson(),
    "GEL": gel.toJson(),
    "BIF": bif.toJson(),
    "BSD": bsd.toJson(),
    "MUR": mur.toJson(),
    "LYD": lyd.toJson(),
    "MWK": mwk.toJson(),
    "MXN": mxn.toJson(),
    "SZL": szl.toJson(),
    "PGK": pgk.toJson(),
    "CHF": chf.toJson(),
    "RUB": rub.toJson(),
    "ILS": ils.toJson(),
    "UGX": ugx.toJson(),
    "TOP": top.toJson(),
    "AED": aed.toJson(),
    "SRD": srd.toJson(),
    "UZS": uzs.toJson(),
    "SAR": sar.toJson(),
    "EGP": egp.toJson(),
    "MGA": mga.toJson(),
    "XPF": xpf.toJson(),
    "CAD": cad.toJson(),
    "GMD": gmd.toJson(),
    "TTD": ttd.toJson(),
    "SCR": scr.toJson(),
    "JPY": jpy.toJson(),
    "BRL": brl.toJson(),
    "SYP": syp.toJson(),
    "SHP": shp.toJson(),
    "TZS": tzs.toJson(),
    "IRR": irr.toJson(),
    "KRW": krw.toJson(),
    "WST": wst.toJson(),
    "JMD": jmd.toJson(),
    "NIO": nio.toJson(),
    "GNF": gnf.toJson(),
    "PHP": php.toJson(),
    "NAD": nad.toJson(),
    "CRC": crc.toJson(),
    "BAM": bam.toJson(),
    "MOP": mop.toJson(),
    "MZN": mzn.toJson(),
    "KPW": kpw.toJson(),
    "UAH": uah.toJson(),
    "IQD": iqd.toJson(),
    "AOA": aoa.toJson(),
    "SLL": sll.toJson(),
    "CUC": cuc.toJson(),
    "CUP": cup.toJson(),
    "RSD": rsd.toJson(),
    "FOK": fok.toJson(),
    "JOD": jod.toJson(),
    "TRY": currenciesTry.toJson(),
    "KID": kid.toJson(),
    "KZT": kzt.toJson(),
    "GIP": gip.toJson(),
    "ISK": isk.toJson(),
    "QAR": qar.toJson(),
    "MMK": mmk.toJson(),
    "THB": thb.toJson(),
    "AWG": awg.toJson(),
    "NGN": ngn.toJson(),
    "BHD": bhd.toJson(),
    "LAK": lak.toJson(),
    "DJF": djf.toJson(),
    "SBD": sbd.toJson(),
    "ANG": ang.toJson(),
    "FKP": fkp.toJson(),
    "BWP": bwp.toJson(),
    "GGP": ggp.toJson(),
    "ZWL": zwl.toJson(),
    "LSL": lsl.toJson(),
    "ARS": ars.toJson(),
    "YER": yer.toJson(),
    "CDF": cdf.toJson(),
    "OMR": omr.toJson(),
    "IDR": idr.toJson(),
    "RWF": rwf.toJson(),
    "MKD": mkd.toJson(),
    "TND": tnd.toJson(),
    "SSP": ssp.toJson(),
    "HNL": hnl.toJson(),
    "LKR": lkr.toJson(),
    "HKD": hkd.toJson(),
  };
}

class Aed {
  String name;
  String symbol;

  Aed({
    required this.name,
    required this.symbol,
  });

  factory Aed.fromJson(Map<String, dynamic> json) => Aed(
    name: json["name"],
    symbol: json["symbol"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "symbol": symbol,
  };
}

class Bam {
  String name;

  Bam({
    required this.name,
  });

  factory Bam.fromJson(Map<String, dynamic> json) => Bam(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Demonyms {
  Eng eng;
  Eng fra;

  Demonyms({
    required this.eng,
    required this.fra,
  });

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
    eng: Eng.fromJson(json["eng"]),
    fra: Eng.fromJson(json["fra"]),
  );

  Map<String, dynamic> toJson() => {
    "eng": eng.toJson(),
    "fra": fra.toJson(),
  };
}

class Eng {
  String f;
  String m;

  Eng({
    required this.f,
    required this.m,
  });

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
    f: json["f"],
    m: json["m"],
  );

  Map<String, dynamic> toJson() => {
    "f": f,
    "m": m,
  };
}

class Flags {
  String png;
  String svg;


  Flags({
    required this.png,
    required this.svg,

  });

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
    png: json["png"],
    svg: json["svg"],

  );

  Map<String, dynamic> toJson() => {
    "png": png,
    "svg": svg,

  };
}

class Idd {
  String root;
  List<String> suffixes;

  Idd({
    required this.root,
    required this.suffixes,
  });

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
    root: json["root"]??'',
    suffixes:json["suffixes"]==null?[]: List<String>.from(json["suffixes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "root": root,
    "suffixes": List<dynamic>.from(suffixes.map((x) => x)),
  };
}

class Maps {
  String googleMaps;
  String openStreetMaps;

  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
    googleMaps: json["googleMaps"],
    openStreetMaps: json["openStreetMaps"],
  );

  Map<String, dynamic> toJson() => {
    "googleMaps": googleMaps,
    "openStreetMaps": openStreetMaps,
  };
}

class Name {
  String common;
  String official;
  Map<String, Translation> nativeName;

  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    common: json["common"],
    official: json["official"],
    nativeName: json["nativeName"]==null?{}:Map.from(json["nativeName"]).map((k, v) => MapEntry<String, Translation>(k, Translation.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "common": common,
    "official": official,
    "nativeName": Map.from(nativeName).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Translation {
  String official;
  String common;

  Translation({
    required this.official,
    required this.common,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    official: json["official"],
    common: json["common"],
  );

  Map<String, dynamic> toJson() => {
    "official": official,
    "common": common,
  };
}

class PostalCode {
  String format;
  String regex;

  PostalCode({
    required this.format,
    required this.regex,
  });

  factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
    format: json["format"],
    regex: json["regex"]??'',
  );

  Map<String, dynamic> toJson() => {
    "format": format,
    "regex": regex,
  };
}

enum Region {
  AFRICA,
  AMERICAS,
  ANTARCTIC,
  ASIA,
  EUROPE,
  OCEANIA
}

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Antarctic": Region.ANTARCTIC,
  "Asia": Region.ASIA,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA
});

enum StartOfWeek {
  MONDAY,
  SATURDAY,
  SUNDAY
}

final startOfWeekValues = EnumValues({
  "monday": StartOfWeek.MONDAY,
  "saturday": StartOfWeek.SATURDAY,
  "sunday": StartOfWeek.SUNDAY
});

enum Status {
  OFFICIALLY_ASSIGNED,
  USER_ASSIGNED
}

final statusValues = EnumValues({
  "officially-assigned": Status.OFFICIALLY_ASSIGNED,
  "user-assigned": Status.USER_ASSIGNED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
