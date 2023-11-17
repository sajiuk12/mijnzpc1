//@dart=2.9
class Mfilterstatusassignment {

  int id;
  String title;
  //num price;


  Mfilterstatusassignment.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    title = parsedJson['title'];
  }
}
