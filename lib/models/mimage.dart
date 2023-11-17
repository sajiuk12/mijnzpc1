//@dart=2.9
class Mimage {
  int id;
  String url;
  String expires_at;
  String document_title;


  Mimage.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    url = parsedJson['url'];
    expires_at = parsedJson['expires_at'];
    document_title = parsedJson['document_title'];



  }
}
