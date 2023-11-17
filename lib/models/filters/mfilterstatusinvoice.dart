//@dart=2.9
class Mfilterstatusinvoice {

  int id;
  String title;
  //num price;


  Mfilterstatusinvoice.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['d'];
    title = parsedJson['title'];
  }
}
