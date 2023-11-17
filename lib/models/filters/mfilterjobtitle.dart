//@dart=2.9
class Mfilterjobtitle {

  int id;
  String title;
  //num price;


  Mfilterjobtitle.fromJson(Map<String , dynamic> parsedJson)
  {
    title = parsedJson['title'];
    id = parsedJson['id'];
  }
}
