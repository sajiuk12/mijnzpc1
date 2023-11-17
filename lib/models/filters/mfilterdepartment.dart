//@dart=2.9
class Mfilterdepartment {

  int id;
  String title;
  String cost;
  //num price;


  Mfilterdepartment.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    title = parsedJson['title'];
    cost = parsedJson['cost'];
  }
}