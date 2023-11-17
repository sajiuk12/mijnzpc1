//@dart=2.9
class Mstrommetr {
  int id;
  String gpj;
  String apkw;
  String steuer;
  String mv;
  String easdatum;
  String eas;
  String aasdatum;
  String aas;

  Mstrommetr.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    gpj = parsedJson['gpj'];
    apkw = parsedJson['apkw'];
    steuer = parsedJson['steuer'];
    mv = parsedJson['mv'];
    easdatum = parsedJson['easdatum'];
    eas = parsedJson['eas'];
    aasdatum = parsedJson['aasdatum'];
    aas = parsedJson['aas'];


  }
}
