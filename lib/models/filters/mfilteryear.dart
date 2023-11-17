//@dart=2.9
class Mfilteryear {

  int id;
  String title;
  //num price;


  Mfilteryear.fromJson(Map<String , dynamic> parsedJson)
  {
    title = parsedJson['title'];
    id = parsedJson['id'];
  }
}
