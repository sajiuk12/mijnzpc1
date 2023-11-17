//@dart=2.9
class Mfiltermonth {

  int id;
  String title;
  //num price;


  Mfiltermonth.fromJson(Map<String , dynamic> parsedJson)
  {
    title = parsedJson['title'];
    id = parsedJson['id'];
  }
}
