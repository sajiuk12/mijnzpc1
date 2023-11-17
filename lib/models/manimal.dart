//@dart=2.9
class Manimal {

    int id;
    String name;


  Manimal.fromJson(Map<String , dynamic> parsedJson)
  {
    id = parsedJson['id'];
    name = parsedJson['name'];

  }
}
