//@dart=2.9
class Mfiltersort {

  int id;
  String title;
  //num price;


  Mfiltersort.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    title = parsedJson['title'];
  }
}
