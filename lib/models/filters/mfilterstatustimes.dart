//@dart=2.9
class Mfilterstatustimes {

  int id;
  String title;
  //num price;


  Mfilterstatustimes.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    title = parsedJson['title'];
  }
}
